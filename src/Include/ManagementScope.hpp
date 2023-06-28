#ifndef MEDIASERVERMANAGER_MANAGEMENTSCOPE_HPP
#define MEDIASERVERMANAGER_MANAGEMENTSCOPE_HPP

#include <QObject>
#include <QtQuick>

namespace MediaServerManager {

    class ManagementScope : public QObject {
    Q_OBJECT

        QML_ELEMENT
    public:
        ManagementScope(QObject *parent = nullptr);
    };
}
#endif
