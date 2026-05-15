import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    property var pluginApi

    width: 500
    height: 600
    color: "#1e1e1e"

    // Daten direkt hier definiert
    readonly property var rows: [
        ["insert",  "ii",   "Normal → Insert"],
        ["normal",  "nn",   "Insert → Normal"],
        ["normal",  "m",    "Normal → Visual"],
        ["visual",  "esc",  "Visual → Normal"],
        ["",        "",     "── NAVIGATION ──"],
        ["n/v/o",   "hjkl", "Bewegung"],
        ["",        "",     "── CLIPBOARD ──"],
        ["n/v",     "y",    "Kopieren"],
        ["n/v",     "d",    "Ausschneiden"],
        ["n/v",     "p",    "Einfügen"],
        ["",        "",     "── ALLGEMEIN ──"],
        ["n/i",     "Ctrl+z","Undo"],
        ["n/i",     "Ctrl+y","Redo"],
        ["normal",  ":w",   "Speichern"]
    ]

    ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 10

        // Titel
        Text {
            text: "Neovim Cheatsheet"
            color: "#ffffff"
            font.pixelSize: 18
            font.bold: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            height: 1
            color: "#3d3d3d"
            Layout.fillWidth: true
        }

        // Scrollbare Tabelle
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ColumnLayout {
                width: parent.width
                spacing: 8

                // Kopfzeile
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Rectangle { width: 70; height: 30; color: "#2d2d2d"; radius: 4
                        Text { anchors.centerIn: parent; text: "Modus"; color: "#aaa"; font.pixelSize: 11; font.bold: true }
                    }
                    Rectangle { width: 100; height: 30; color: "#2d2d2d"; radius: 4
                        Text { anchors.centerIn: parent; text: "Kürzel"; color: "#aaa"; font.pixelSize: 11; font.bold: true }
                    }
                    Rectangle { Layout.fillWidth: true; height: 30; color: "#2d2d2d"; radius: 4
                        Text { anchors.centerIn: parent; text: "Beschreibung"; color: "#aaa"; font.pixelSize: 11; font.bold: true }
                    }
                }

                // Datenzeilen
                Repeater {
                    model: rows
                    delegate: Item {
                        Layout.fillWidth: true
                        height: rowData[0] === "" ? 30 : 25

                        // Abschnittsüberschrift
                        Text {
                            visible: rowData[0] === ""
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: rowData[2]
                            color: "#8bc34a"  // grünlich
                            font.pixelSize: 11
                            font.bold: true
                        }

                        // Normale Zeile
                        RowLayout {
                            visible: rowData[0] !== ""
                            anchors.fill: parent
                            spacing: 10

                            Text {
                                width: 70
                                text: rowData[0]
                                color: "#81a1c1"
                                font.pixelSize: 10
                                font.family: "monospace"
                            }

                            Text {
                                width: 100
                                text: rowData[1]
                                color: "#88c0d0"
                                font.pixelSize: 11
                                font.family: "monospace"
                                font.bold: true
                            }

                            Text {
                                Layout.fillWidth: true
                                text: rowData[2]
                                color: "#d8dee9"
                                font.pixelSize: 11
                                elide: Text.ElideRight
                            }
                        }
                    }
                }
            }
        }
    }
}
