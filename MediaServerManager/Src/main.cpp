#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ManagementScope.hpp"

using namespace MediaServerManager;

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);
    qmlRegisterType<ManagementScope>("MediaServerManager", 0, 1, "ManagementScope");
    qmlRegisterSingletonType(QUrl("qrc:/Styles/ManagementButtonStyle.qml"),
                             "ManagementButtonStyle", 1, 0, "ManagementButtonStyle");
    qmlRegisterSingletonType(QUrl(u"qrc:/Styles/FontStyle.qml"_qs),
                             "FontStyle", 1, 0, "FontStyle");
    qmlRegisterSingletonType(QUrl(u"qrc:/Styles/TextEditStyle.qml"_qs),
                             "TextEditStyle", 1, 0, "TextEditStyle");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app,
                     [url](QObject* obj, const QUrl& objUrl) {
                         if (!obj && url == objUrl) {
                             QCoreApplication::exit(-1);
                         }
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
