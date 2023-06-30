#ifndef MEDIASERVERMANAGER_BACK_HPP
#define MEDIASERVERMANAGER_BACK_HPP

#include <QObject>
#include <QString>
#include <qqml.h>

namespace MediaServerManager {

    /**
     *
     */
    class Back : public QObject {
    Q_OBJECT

        Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
        QML_ELEMENT
    public:
        explicit Back(QObject *parent = nullptr);

        QString userName() { return m_userName; }

        void setUserName(const QString &userName) {
            if (userName == m_userName)
                return;

            m_userName = userName;
            emit userNameChanged();
        }

    signals:
        void userNameChanged();

    private:
        QString m_userName = "Wel back";
    };
}

#endif
