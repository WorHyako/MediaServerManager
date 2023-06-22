qt_add_library(JsLibrary STATIC)

qt_add_qml_module(JsLibrary
        VERSION 1.0
        URI Frontend.Js
        RESOURCE_PREFIX /Frontend/Js
        QML_FILES
            ConfigLoader.js
            DynamicItemCollector.js
            ItemCreator.js
            Renamer.js)