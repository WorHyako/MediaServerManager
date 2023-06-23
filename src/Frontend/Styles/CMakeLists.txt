qt_add_library(CustomStyles STATIC)

qt_add_qml_module(CustomStyles
        VERSION 1.0
        URI Frontend.Styles
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            FontStyle.qml
            ManagementButtonStyle.qml
            TextEditStyle.qml
        DEPENDENCIES
            QtQuick)
