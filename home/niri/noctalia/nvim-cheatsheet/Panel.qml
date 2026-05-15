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
      id: Panel
      anchors.fill: parent
      color: "transparent"

      ColumnLaylout {
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
      }
    }
}
