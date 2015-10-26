#include <QApplication>
#include <QQmlApplicationEngine>

#include "setting.h"
#include "battery.h"

#include "timezonedatamodel.h"
#include "pyracontroller.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // @uri fi.bzar.qmlcomponents
    qmlRegisterType<Setting>("Setting", 1, 0, "Setting");
    qmlRegisterType<Battery>("Battery", 1, 0, "Battery");
    qmlRegisterType<TimeZoneDataModel>("TimeZoneDataModel", 1, 0, "TimeZoneDataModel");
    qmlRegisterType<PyraController>("Pyra", 1, 0, "PyraController");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
