#include "QmlLiveData.hpp"

using namespace MediaServerManager::QmlObjects::LiveData;

QmlLiveData::QmlLiveData(QObject *parent) noexcept
        : QObject(parent),
          _sqlFieldName("") {
}

#include <iostream>

void QmlLiveData::liveDataChanged(QString dataName, QVariant data) {
    std::cout << "\nQmlLiveData - liveDataChanged - " << dataName.toStdString();
    setSqlFieldName(dataName);
    setSqlFieldValue(data);
}

#pragma region Accessors

QString QmlLiveData::getSqlFieldName() noexcept {
    return _sqlFieldName;
}

QVariant QmlLiveData::getSqlFieldValue() noexcept {
    return _sqlFieldValue;
}

#pragma endregon Accessors

#pragma region Mutators

void QmlLiveData::setSqlFieldName(QString sqlFieldName) noexcept {
    _sqlFieldName = std::move(sqlFieldName);
    std::cout << "\nQmlLiveData - setSqlFieldName - " << sqlFieldName.toStdString();

    emit nameChanged(_sqlFieldName);
}

void QmlLiveData::setSqlFieldValue(QVariant sqlFieldValue) noexcept {
    _sqlFieldValue = sqlFieldValue;

    emit dataChanged(sqlFieldValue);
}

#pragma endregion Mutators