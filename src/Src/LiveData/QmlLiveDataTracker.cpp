#include "LiveData/QmlLiveDataTracker.hpp"

using namespace MediaServerManager::LiveData;

#include <iostream>

void QmlLiveDataTracker::notifyAll(const std::string &dataName, const std::any &data) noexcept {
    QString qDataName(dataName.c_str());
    QVariant qData;

    std::cout << "\nQmlLiveDataTracker - notifyAll - " << dataName;

    emit liveDataChanged(qDataName, qData);
}
