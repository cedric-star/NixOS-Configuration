import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

Item {
    id: root
    property var pluginApi

    property real contentPreferredWidth: 680 * Style.uiScaleRatio
    property real contentPreferredHeight: 540 * Style.uiScaleRatio

    // SmartPanel properties (required for panel behavior)
    readonly property var geometryPlaceholder: panelContainer
    readonly property bool allowAttach: true

    // Preferred dimensions
    anchors.fill: parent

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

    Rectangle {
      id: panel
      anchors.fill: parent
      color: "transparent"

      ColumnLayout {
        anchors {
          fill: parent
          margins: Style.marginL
        }
        spacing: Style.marginL

        NText {
          text: "hallo welt!"
          pointSize: Style.fontSizeL
          font.weight: Font.Bold
          color: Color.mOnSurface
        }

        // ===== TABELLE =====
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // Header
            RowLayout {
                Layout.fillWidth: true
                spacing: Style.marginM

                NText {
                    text: "Modus"
                    pointSize: Style.fontSizeS
                    font.weight: Font.Bold
                    color: Color.mOnSurfaceVariant
                    Layout.preferredWidth: 80 * Style.uiScaleRatio
                }
                NText {
                    text: "Shortcut"
                    pointSize: Style.fontSizeS
                    font.weight: Font.Bold
                    color: Color.mOnSurfaceVariant
                    Layout.preferredWidth: 120 * Style.uiScaleRatio
                }
                NText {
                    text: "Beschreibung"
                    pointSize: Style.fontSizeS
                    font.weight: Font.Bold
                    color: Color.mOnSurfaceVariant
                    Layout.fillWidth: true
                }
            }

            // Trennlinie unter dem Header
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: Style.marginS
                Layout.bottomMargin: Style.marginS
                height: 1
                color: Color.mOutline
            }

            // Scrollbarer Tabelleninhalt
            Flickable {
                Layout.fillWidth: true
                Layout.fillHeight: true
                contentHeight: tableColumn.implicitHeight
                clip: true

                Column {
                    id: tableColumn
                    width: parent.width
                    spacing: 2 * Style.uiScaleRatio

                    Repeater {
                        model: root.rows

                        delegate: Item {
                            width: parent.width
                            height: isSeparator ? 36 * Style.uiScaleRatio : rowLayout.implicitHeight

                            readonly property bool isSeparator: modelData[0] === "" && modelData[1] === ""

                            // Normale Datenzeile
                            RowLayout {
                                id: rowLayout
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width
                                visible: !parent.isSeparator
                                spacing: Style.marginM

                                NText {
                                    text: modelData[0]
                                    pointSize: Style.fontSizeS
                                    color: Color.mOnSurface
                                    opacity: 0.7
                                    Layout.preferredWidth: 80 * Style.uiScaleRatio
                                }
                                NText {
                                    text: modelData[1]
                                    pointSize: Style.fontSizeS
                                    color: Color.mPrimary
                                    font.family: "monospace"
                                    Layout.preferredWidth: 120 * Style.uiScaleRatio
                                }
                                NText {
                                    text: modelData[2]
                                    pointSize: Style.fontSizeS
                                    color: Color.mOnSurface
                                    Layout.fillWidth: true
                                }
                            }

                            // Separator-Zeile (z.B. "── NAVIGATION ──")
                            NText {
                                anchors.centerIn: parent
                                visible: parent.isSeparator
                                text: modelData[2]
                                pointSize: Style.fontSizeS
                                font.weight: Font.Bold
                                color: Color.mOnSurfaceVariant
                                opacity: 0.6
                            }
                        }
                    }
                }
            }
        }
        // ===== ENDE TABELLE =====
      }
    }    }
}
