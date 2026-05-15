import QtQuick
import QtQuick.Layouts

Item {
    id: root
    property var pluginApi
    property var screen

    implicitWidth: btn.implicitWidth
    implicitHeight: btn.implicitHeight

    NIconButtonHot {
        id: btn
        icon: "brand-vim"          // Tabler-Icon-Name
        tooltip: "Nvim Cheatsheet"
        onClicked: pluginApi.togglePanel(root.screen, this)
    }
}
