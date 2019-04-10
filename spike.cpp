#include "TestApp.h"

#include <iostream>

int main(int argc, char *argv[])
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //! Qt's render loop will run animations too fast on Windows and macOS 10.14
    //! if QSG_RENDER_LOOP is set to 'threaded' or 'windows'. For more info, see
    //! note in: https://doc.qt.io/qt-5/qtquick-visualcanvas-
    //!              scenegraph.html#scene-graph-and-rendering
    //! and: https://bugreports.qt.io/browse/QTBUG-70962
    if (!qputenv("QSG_RENDER_LOOP", "basic")) {
        std::cerr << "Failed to set QSG_RENDER_LOOP environment variable."
                  << std::endl;
    }

    TestApp app(argc, argv);
    return app.exec();
}
