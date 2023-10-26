#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "ManagementScope.hpp"
#include "Json/JsonQmlWrapper.hpp"
#include "Frontend/QmlObjects/Network/QmlSocketManager.hpp"
#include "Command/ActionCommand.hpp"
#include "Command/CommandBuilder.hpp"
#include "WorLibrary/Sql/MySqlManager.hpp"
#include "WorLibrary/TemplateWrapper/Singleton.hpp"
#include "WorLibrary/Network/TcpSocket.hpp"
#include "Utils/AuthData.hpp"

#include "Utils/Sql/Events.hpp"

#include "pugixml.hpp"

using namespace MediaServerManager::Command;
using namespace MediaServerManager;
using namespace Wor::Network;

int main(int argc, char *argv[]) {

    auto &manager = Wor::TemplateWrapper::Singleton<Wor::Sql::MySqlManager>::GetInstance();
    manager.Configure(Utils::Sql::authParameters);
    auto res = manager.TryToConnect();

    if (res != Wor::Sql::MySqlManager::ConnectionStatus::Connected) {
        return -300;
    }

    Wor::Sql::SelectStatementData statementData {
            { "EventID", "EventTypeNum", "LotNum" },
            "vw_eventslist",
            "EventID",
            "EventID > 2"
    };
    auto answer = manager.Select(statementData);

    std::vector<ActionCommand *> commandList;

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

//    auto res = QmlObjects::Network::QmlSocketManager::Add(Wor::Network::EndPoint("127.0.0.1", 7000), 0);
//    auto socket0 = QmlObjects::Network::QmlSocketManager::GetSocket(0);
//    auto con0 = socket0->TryToConnect();
//    auto ex2 = playCommand.Execute(socket0);

    /***********
     * Qt Part *
     ***********/
    QGuiApplication app(argc, argv);
    qSetMessagePattern("%{file}:%{line} %{function} -> "
                       "%{if-category}%{category}: %{endif}%{message}");
    qmlRegisterType<MediaServerManager::Json::JsonQmlWrapper>(
            "MediaServerManager", 1, 0, "JsonQmlWrapper");

    /*********
     * Enums *
     *********/
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
