#include <QApplication>
#include <QtDeclarative/QDeclarativeView>
#include <QtDeclarative/QDeclarativeEngine>
#include <QtDeclarative/QDeclarativeComponent>
#include <QtDeclarative/QDeclarativeContext>
#include "fpga.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    FPGA tmpMB;
    QDeclarativeView qmlView;
    //
    QObject::connect((QObject*)qmlView.engine(),SIGNAL(quit()), &a ,SLOT(quit()));
    qmlView.rootContext()->setContextProperty("mb",&tmpMB);
    qmlView.setSource(QUrl("qrc:qml/p0_kjh.qml"));
    qmlView.setFixedSize(1024,768);
    qmlView.show();
    return a.exec();
}
