#ifndef TEST_APP_H
#define TEST_APP_H

#include <QApplication>
#include <QQmlApplicationEngine>

class TestApp : public QApplication
{
    Q_OBJECT

  public:
    explicit TestApp(int &argc, char *argv[]);

  private:
    QQmlApplicationEngine _qmlEngine;
};

#endif
