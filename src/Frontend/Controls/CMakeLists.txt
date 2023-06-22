qt_add_library(CustomControls STATIC)

qt_add_qml_module(CustomControls
        VERSION 1.0
        URI Controls
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ButtonAddNewElement.qml
            ButtonLoadConfig.qml
            ButtonSaveConfig.qml
            CloseButton.qml
            ContextMenu.qml
            ContextMenuAction.qml
            ContextMenuItem.qml
            EditTextField.qml
            ManagementButton.qml
            QuickTitleLine.qml
            TextField.qml
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls)