#include "QmlLiveData.hpp"

#include "WorLibrary/TemplateWrapper/Singleton.hpp"
#include "LiveData/LiveData.hpp"

#include <QString>

using namespace MediaServerManager::QmlObjects::LiveData;

QmlLiveData::QmlLiveData(QObject *parent) noexcept
        : QObject(parent),
          _dataName("currentTourWinnersCount") {
    updateData();
}

#include <iostream>

void QmlLiveData::liveDataChanged(QString dataName, QString data) {
    std::cout << "\nQmlLiveData - liveDataChanged - Name: " << dataName.toStdString()
              << ", Value: " << data.toStdString();
    if (dataName != _dataName) {
        return;
    }
    setData(std::move(data));
}

void QmlLiveData::updateData() noexcept {
    if (_dataName.isEmpty()) {
        return;
    }
    auto &liveData = Wor::TemplateWrapper::Singleton<Livedata::LiveData>::getInstance();
    auto data = liveData.get(_dataName.toStdString());
    if (data.has_value()) {
        setData(data.value().c_str());
    }
}

#pragma region Accessors

QString QmlLiveData::getDataName() noexcept {
    return _dataName;
}

QString QmlLiveData::getData() noexcept {
    return _data;
}

#pragma endregon Accessors

#pragma region Mutators

void QmlLiveData::setDataName(QString dataName) noexcept {
    _dataName = std::move(dataName);
    std::cout << "\nQmlLiveData - setSqlFieldName - " << _dataName.toStdString();

    emit dataNameChanged(_dataName);

    updateData();
}

void QmlLiveData::setData(QString data) noexcept {
    _data = std::move(data);

    emit dataChanged(_data);
}

#pragma endregion Mutators
