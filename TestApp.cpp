#include "TestApp.h"

#include <QUrl>

TestApp::TestApp(int &argc, char *argv[])
    : QApplication(argc, argv)
{
    _qmlEngine.load(QUrl::fromLocalFile("./spike.qml"));
}
