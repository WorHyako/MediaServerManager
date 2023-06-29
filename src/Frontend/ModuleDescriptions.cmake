list(APPEND Modules Controls Styles Js Backgrounds Widgets Settings)

# Controls
list(APPEND Controls_Dependencies
        QtQuick
        QtQuick.Layouts
        QtQuick.Controls
        Frontend.Backgrounds
        Frontend.Controls
        Frontend.Styles
        Frontend.Js)

list(APPEND Controls_FileExt
        .qml)

# Widgets
list(APPEND Widgets_Dependencies
        QtQuick
        QtQuick.Layouts
        QtQuick.Controls
        Frontend.Widgets
        Frontend.Backgrounds
        Frontend.Controls
        Frontend.Js)

list(APPEND Widgets_FileExt
        .qml)

# Settings
list(APPEND Settings_Dependencies
        QtQuick
        QtQuick.Layouts
        QtQuick.Controls
        Frontend.Controls
        Frontend.Backgrounds
        Frontend.Settings)

list(APPEND Settings_FileExt
        .qml)

# Styles
list(APPEND Styles_Dependencies
        QtQml
        QtQuick)

list(APPEND Styles_Type
        Singleton)

list(APPEND Styles_FileExt
        .qml)

# Backgrounds
list(APPEND Backgrounds_Dependencies
        QtQuick
        Frontend.Styles)

list(APPEND Backgrounds_FileExt
        .qml)

# Js
list(APPEND Js_Dependencies
        QtQuick
        MediaServerManager
        QtQml)

list(APPEND Js_FileExt
        .js)
