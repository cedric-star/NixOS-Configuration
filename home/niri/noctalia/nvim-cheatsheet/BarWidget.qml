import QtQuick
import QtQuick.Layouts

Item {
    id: root
    property var pluginApi
    property var screen

    implicitWidth: 28
    implicitHeight: 28

    Rectangle {
        anchors.fill: parent
        color: mouseArea.containsMouse ? Qt.rgba(1,1,1,0.1) : "transparent"
        radius: 6

        Text {
            anchors.centerIn: parent
            text: ""           // Vim-Icon aus Nerd Font, oder:
            // text: "VIM"     // Fallback als Text
            color: "white"
            font.pixelSize: 14
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if (pluginApi) pluginApi.togglePanel(root.screen, root)
            }
        }
    }
}
