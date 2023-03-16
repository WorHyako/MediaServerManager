#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "ManagementScope.hpp"
#include "json/JsonQmlWrapper.hpp"
#include "network/TcpSocket.hpp"

#include "pugixml.hpp"

int main(int argc, char* argv[]) {

    pugi::xml_document doc;
    auto node = doc.append_child(pugi::node_declaration);
    node.append_attribute("attr");
    pugi::xml_attribute attribute = node.attribute("attr");
    attribute.set_name("name");
    attribute.set_value(10);
    volatile auto val = node.attribute("attr").value();
    doc.print(std::cout);


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

    return app.exec();
}