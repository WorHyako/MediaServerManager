#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include <QString>

#include "WorLibrary/Network/TcpSocket.hpp"

namespace MediaServerManager::QmlObjects::Network {

    /**
     *
     */
    class QmlSocketManager : public QObject {
    Q_OBJECT

        QML_SINGLETON

        QML_ELEMENT
    public:
        /**
         * Ctor
         * @param parent
         */
        explicit QmlSocketManager(QObject *parent = nullptr);

        /**
         *
         * @param endPoint
         * @param socketIndex
         * @return
         */
        [[nodiscard]] static bool add(Wor::Network::EndPoint endPoint, std::uint8_t socketIndex) noexcept;

        /**
         *
         * @param address
         * @param port
         * @param socketIndex
         * @return
         */
        Q_INVOKABLE [[nodiscard]] static bool add(QString address, int port, int socketIndex) noexcept;

        /**
         *
         * @param socketIndex
         */
        Q_INVOKABLE static void remove(std::uint8_t socketIndex) noexcept;

        /**
         *
         * @param socketIndex
         * @return
         */
        [[nodiscard]] static std::shared_ptr<Wor::Network::TcpSocket> getSocket(std::uint8_t socketIndex) noexcept;

    private:
        /**
         *
         */
        std::unique_ptr<Wor::Network::TcpSocket> _socketManager;

    public:
#pragma region Accessors

#pragma endregion Accessors

#pragma region Mutators

#pragma endregion Mutators
    };
}
