qt_add_library(CustomBackgrounds STATIC)

qt_add_qml_module(CustomBackgrounds
        VERSION 1.0
        URI Frontend.Backgrounds
        RESOURCE_PREFIX /Frontend/Backgrounds
        QML_FILES
            TextBackgroundRectangle.qml
            TabButtonBackground.qml
            ButtonBackgroundRectangle.qml
        DEPENDENCIES
            QtQuick
            QtQuick.Controls)