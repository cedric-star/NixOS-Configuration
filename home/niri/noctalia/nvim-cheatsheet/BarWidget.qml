import QtQuick

Rectangle {
    id: root
    property var pluginApi
    property var screen

    width: 60
    height: 28
    color: "red"

    Text {
        anchors.centerIn: parent
        text: "VIM"
        color: "white"
        font.pixelSize: 12
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (pluginApi) pluginApi.togglePanel(root.screen, root)
        }
    }
}
