import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    height: 1000
    title: "Media Server Manager"
    visible: true
    width: 1920

    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/Frontend/Assets/app_background.png"
        z: -1
    }
    Grid {
        anchors.fill: parent
        columns: 2
        spacing: 10

        ListButtonsTexts {
        }
        Rectangle {
            /**
             * Color Green, but alpha - 0 to set Rectangle invisible
             */
            color: "#00ff00ff"
            anchors {
                bottomMargin: 40
                fill: parent
                leftMargin: 600
                rightMargin: 40
                topMargin: 40
            }
            ControlTabs {
                anchors.fill: parent
            }
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
    // QuickButtons {
    // }
}
