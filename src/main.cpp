#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "ManagementScope.hpp"
#include "Json/JsonQmlWrapper.hpp"
#include "Network/TcpSocket.hpp"
#include "Command/ActionCommand.hpp"
#include "Command/CommandBuilder.hpp"

#include "pugixml.hpp"

using namespace MediaServerManager::Command;

int main(int argc, char *argv[]) {
    std::vector<Command *> commandList;

    CommandItemList hideItems;
    hideItems.emplace_back("filter", "hide");
    auto hideCommand = CommandBuilder<ActionCommand>::BuildCommand(hideItems);
    CommandItemList playItems;
    playItems.emplace_back("filter", "play");
    playItems.emplace_back("file", "example.mp4");
    auto playCommand = CommandBuilder<ActionCommand>::BuildCommand(playItems);

    pugi::xml_document doc;
    auto node = doc.append_child(pugi::node_declaration);
    node.append_attribute("attr");
    pugi::xml_attribute attribute = node.attribute("attr");
    attribute.set_name("name");
    attribute.set_value(10);
    volatile auto val = node.attribute("attr").value();
    std::stringstream ss;
    doc.print(ss);
    auto s = ss.str();

//    boost::asio::io_context context;
//    auto socket = std::make_unique<wor::Network::TcpSocket>(context);
//    socket->DestinationEndPoint(wor::Network::EndPoint("127.0.0.1", 7000));
//    auto res = socket->TryToConnect();
//
//    auto socket2 = std::make_unique<wor::Network::TcpSocket>(context);
//    socket2->DestinationEndPoint(wor::Network::EndPoint("127.0.0.1", 8000));
//    auto res2 = socket2->TryToConnect();

//    hideCommand.Execute(socket.get());
//    playCommand.Execute(socket2.get());

    ///////////////
    /// Qt Part ///
    ///////////////
    QGuiApplication app(argc, argv);
    qSetMessagePattern("%{file}:%{line} %{function} -> "
                       "%{if-category}%{category}: %{endif}%{message}");
    qmlRegisterType<MediaServerManager::Json::JsonQmlWrapper>(
            "MediaServerManager", 1, 0, "JsonQmlWrapper");

    /// Enums
    qmlRegisterUncreatableType<MediaServerManager::DynamicScopeType>(
            "MediaServerManager", 1, 0, "DynamicScopeType",
            "Not creatable as it is an enum type");

    QQmlApplicationEngine engine;
    engine.addImportPath(":/WorHyako/MediaServerManager");
    const auto url(QUrl(u"qrc:/WorHyako/MediaServerManager/Frontend/main.qml"_qs));
    QObject::connect(
            &engine, &QQmlApplicationEngine::objectCreated, &app,
            [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl) {
                    QCoreApplication::exit(-1);
                }
            },
            Qt::QueuedConnection);
    MediaServerManager::Json::JsonQmlWrapper jsonManager;
    engine.rootContext()->setContextProperty("jsonManager", &jsonManager);

    engine.load(url);
    return app.exec();
}
