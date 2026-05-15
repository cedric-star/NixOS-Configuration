import QtQuick

Rectangle {
    id: root
    property var pluginApi
    property var screen

    width: 60
    height: 28
    color: "#2d2d2d"  // dunkles Graz statt rot
    radius: 6

    Text {
        id: buttonText
        anchors.centerIn: parent
        text: "Nvim"
        color: "#ffffff"
        font.pixelSize: 12
        font.family: "monospace"
        font.bold: true
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if (pluginApi) {
                pluginApi.togglePanel(root.screen, root)
            }
        }
        onEntered: parent.color = "#3d3d3d"
        onExited: parent.color = "#2d2d2d"
    }
}
