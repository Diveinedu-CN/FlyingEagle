#include <QtGui/QGuiApplication>
#include <QFontDatabase>
#include "qtquick2applicationviewer.h"
#include <QDebug>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
#ifdef Q_OS_LINUX
    QFontDatabase fontDB;
    qDebug()<<"ScreenSize:"<<"Fonts:"<<fontDB.families();
    QFont font = app.font();
    //设置程序全局字体为微软雅黑,EGLFS平台插件的情况下,字体文件必须在$QTDIR/lib/fonts/下
    font.setFamily(QString("Microsoft YaHei"));
    app.setFont(font);
#endif
    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/FlyingEagle/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
