#pragma once

#include <QObject>
#include <QtQuick>

namespace MediaServerManager {

    class ManagementScope : public QObject {
    Q_OBJECT

        QML_ELEMENT
    public:
        /**
         * Ctor
         * @param parent Qt parent object
         */
        ManagementScope(QObject *parent = nullptr);
    };
}
