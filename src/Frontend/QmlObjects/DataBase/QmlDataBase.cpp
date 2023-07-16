#include "QmlDataBase.hpp"

using namespace MediaServerManager::QmlObjects::DataBase;

QmlDataBase::QmlDataBase(QObject *parent) noexcept
        : QObject(parent) {
}

QString QmlDataBase::requestData(const QString &requestString) noexcept {
    return QString();
}
