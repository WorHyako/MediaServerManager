#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "ManagementScope.hpp"
#include "json/JsonQmlWrapper.hpp"
#include "network/TcpSocket.hpp"

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);
    qSetMessagePattern("%{file}:%{line} %{function} -> %{if-category}%{category}: %{endif}%{message}");
    qmlRegisterType<MediaServerManager::Json::JsonQmlWrapper>("MediaServerManager", 1, 0, "JsonQmlWrapper");

    /// Styles
    qmlRegisterSingletonType(
            QUrl("qrc:/Styles/ManagementButtonStyle.qml"), "ManagementButtonStyle", 1, 0, "ManagementButtonStyle");
    qmlRegisterSingletonType(
            QUrl(u"qrc:/Styles/FontStyle.qml"_qs), "FontStyle", 1, 0, "FontStyle");
    qmlRegisterSingletonType(
            QUrl(u"qrc:/Styles/TextEditStyle.qml"_qs), "TextEditStyle", 1, 0, "TextEditStyle");

    /// Enums
    qmlRegisterUncreatableType<MediaServerManager::DynamicScopeType>(
            "MediaServerManager", 1, 0, "DynamicScopeType", "Not creatable as it is an enum type");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app,
                     [url](QObject* obj, const QUrl& objUrl) {
                         if (!obj && url == objUrl) {
                             QCoreApplication::exit(-1);
                         }
                     }, Qt::QueuedConnection);
    MediaServerManager::Json::JsonQmlWrapper jsonManager;
    engine.rootContext()->setContextProperty("jsonManager", &jsonManager);

    engine.load(url);

    boost::asio::io_context context;
    wor::network::TcpSocket socket(context);

    socket.SetDestinationEndPoint(wor::network::EndPoint("127.0.0.1", 6000));
    volatile bool result = socket.TryToConnect();
    return app.exec();
}