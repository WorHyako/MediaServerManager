import QtQuick
import QtQuick.Controls

/**
 *  ApplicationWindow root
 *      | Text
 */
ApplicationWindow {
    id: root
    height: 100
    width: 100

    Text {
        anchors.centerIn: parent
        text: qsTr("Hello World.")
    }
}
