cmake_minimum_required (VERSION 3.7.0 FATAL_ERROR)
set (PROJECT_NAME "TestApp")
project (${PROJECT_NAME})

if(${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.10.0")
    # set policy whether to process generated files OLD == no processing of generated files
    cmake_policy(SET CMP0071 OLD)
endif()

include(conan.cmake)
conan_cmake_run(CONANFILE conanfile.py
                BASIC_SETUP KEEP_RPATHS CMAKE_TARGETS
                OPTIONS ${DVAULT_CONAN_OPTIONS}
                BUILD missing)

# Here we set the Qt dirs to the conan directories because the Qt-Frameworks brings a lot of usefull
# cmake magic to our build enviroment (automoc, translation, qresource etc.). With this we can use
# the whole Qt-Framework in cmake completly transparent no matter if conan or system Qt.
set (CMAKE_PREFIX_PATH ${CONAN_LIB_DIRS_QT}/cmake)
set (Qt5Core_DIR ${CMAKE_PREFIX_PATH}/Qt5Core)
set (Qt5Gui_DIR ${CMAKE_PREFIX_PATH}/Qt5Gui)
set (Qt5Quick_DIR ${CMAKE_PREFIX_PATH}/Qt5Quick)
set (Qt5QuickControls2_DIR ${CMAKE_PREFIX_PATH}/Qt5QuickControls2)
set (Qt5Widgets_DIR ${CMAKE_PREFIX_PATH}/Qt5Widgets)

message(STATUS "set prefix path for qt.conf in bin directory")
set(CONAN_QT_PREFIX_PATH ${CONAN_QT_ROOT})
configure_file(qt.conf.in ${CMAKE_BINARY_DIR}/bin/qt.conf @ONLY)

find_package(Qt5Core           REQUIRED)
find_package(Qt5Widgets        REQUIRED)
find_package(Qt5Quick          REQUIRED)
find_package(Qt5QuickControls2 REQUIRED)
find_package(Qt5Gui            REQUIRED)

set(CMAKE_AUTOMOC ON)

set_target_properties(${BDRIVE_GUI_LIBRARY_NAME} PROPERTIES
                      POSITION_INDEPENDENT_CODE ON)

set (DVAULT_GUI_BINARY_NAME "spike")
add_executable        (${DVAULT_GUI_BINARY_NAME} "spike.cpp" "TestApp.h" "TestApp.cpp")
target_link_libraries (${DVAULT_GUI_BINARY_NAME}
                       Qt5::Core Qt5::Quick Qt5::Widgets Qt5::Gui Qt5::QuickControls2)

configure_file("Info.plist.in" "${CMAKE_BINARY_DIR}/bin/Info.plist" @ONLY)
