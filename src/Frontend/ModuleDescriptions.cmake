# This file describes qml module's properties:
# - Dependencies (f.e. QtQuick);
# - File extensions (f.e. .qml);
# - Module type (f.e. Singleton).
# So it can be used as map ${ ${ModuleName}_${ModuleProperty} } f.e Controls_Dependencies

list(APPEND Modules Controls Styles Js Backgrounds Widgets Settings Dialogs)

################
### Controls ###
################
list(APPEND Controls_Dependencies
        QtQuick
        QtQuick.Layouts
        QtQuick.Controls
        Frontend.Backgrounds
        Frontend.Controls
        Frontend.Styles
        QtQml.Models
        Frontend.Js
        Frontend.QmlObjects.Command)

list(APPEND Controls_FileExt
        .qml)

###############
### Widgets ###
###############
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

################
### Settings ###
################
list(APPEND Settings_Dependencies
        QtQuick
        QtQuick.Layouts
        QtQuick.Controls
        Frontend.Controls
        Frontend.Backgrounds
        Frontend.Settings)

list(APPEND Settings_FileExt
        .qml)

##############
### Styles ###
##############
list(APPEND Styles_Dependencies
        QtQml
        QtQuick)

list(APPEND Styles_Type
        Singleton)

list(APPEND Styles_FileExt
        .qml)

###################
### Backgrounds ###
###################
list(APPEND Backgrounds_Dependencies
        QtQuick
        Frontend.Styles)

list(APPEND Backgrounds_FileExt
        .qml)

##########
### Js ###
##########
list(APPEND Js_Dependencies
        QtQuick
        MediaServerManager
        QtQml)

list(APPEND Js_FileExt
        .js)

###############
### Dialogs ###
###############
list(APPEND Dialogs_Dependencies
        QtQuick
        QtQuick.Controls
        QtQuick.Layouts
        Qml.Models
        Frontend.Controls
        Frontend.Backgrounds
        Frontend.Js)
