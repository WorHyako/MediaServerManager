#include "LiveData/QmlLiveDataTracker.hpp"

using namespace MediaServerManager::LiveData;

#include <iostream>

void QmlLiveDataTracker::notifyAll(const std::string &dataName, const std::string &data) noexcept {
    QString qDataName(dataName.c_str());
    QString qData(data.c_str());

    std::cout << "\nQmlLiveDataTracker - notifyAll - " << dataName;

    emit liveDataChanged(qDataName, qData);
}
