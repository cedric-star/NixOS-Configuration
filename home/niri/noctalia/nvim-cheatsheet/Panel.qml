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
  readonly property var geometryPlaceholder: panel
  readonly property bool allowAttach: true

  // Preferred dimensions
  anchors.fill: parent

  // Daten direkt hier definiert
  ListModel {
    id: itemsModel
    ListElement { mode: "Mode"; map: "Keymap"; fun: "Function" }
    ListElement { mode: "insert"; map: "ii"; fun: "Normal → Insert" }
    ListElement { mode: "normal"; map: "nn"; fun: "Insert → Normal" }
    ListElement { mode: "normal"; map: "m"; fun: "Normal → Visual" }
    ListElement { mode: "visual"; map: "esc"; fun: "Visual → Normal" }
    ListElement { mode: "n/v/o"; map: "j k l ö"; fun: "← → ↓ ↑" }
    ListElement { mode: "normal"; map: "Ctrl ← → ↓ ↑"; fun: "Fenster wechseln: links rechts hoch runter" }
    ListElement { mode: "n/v"; map: "c"; fun: "Kopieren (= y / yank)" }
    ListElement { mode: "n/v"; map: "x"; fun: "Ausschneiden (= d / delete)" }
    ListElement { mode: "n/v"; map: "v"; fun: "Einfügen nach Cursor (= p)" }
    ListElement { mode: "command"; map: "s/alt/neu/"; fun: "Ersetzen in aktueller Zeile" }
    ListElement { mode: "command"; map: "%s/alt/neu/"; fun: "Ersetzen in gesamter Datei" }
    ListElement { mode: "command"; map: ":%s/alt/neu/gc"; fun: "Ersetzen mit Bestätigung pro Treffer" }
    ListElement { mode: "command"; map: ":42"; fun: "Zu Zeile 42 springen (absolut)" }
    ListElement { mode: "normal"; map: "10k"; fun: "10 Zeilen runter (ohne command)" }
    ListElement { mode: "normal"; map: "10l"; fun: "10 Zeilen hoch (ohne command)" }
    ListElement { mode: "n/i"; map: "Ctrl z"; fun: "Undo" }
    ListElement { mode: "n/i"; map: "Ctrl y"; fun: "Redo" }
    ListElement { mode: "n/i"; map: "Ctrl s"; fun: "Datei speichern" }
    ListElement { mode: "normal"; map: "Space qq"; fun: "Alle Fenster schließen (quit all)" }
    ListElement { mode: "normal"; map: "Space wd"; fun: "Aktuelles Fenster schließen" }
    ListElement { mode: "normal"; map: "Space -"; fun: "Fenster horizontal teilen (split below)" }
    ListElement { mode: "normal"; map: "Space |"; fun: "Fenster vertikal teilen (split right)" }
  }
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

      Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: Color.mSurfaceVariant
        radius: Style.radiusL

        NScrollView {
          anchors.fill: parent

          ColumnLayout {
            width: parent.width
            spacing: 0

            // Header-Zeile
            GridLayout {
              Layout.fillWidth: true
              Layout.leftMargin: Style.marginL
              Layout.rightMargin: Style.marginL
              Layout.topMargin: Style.marginM
              Layout.bottomMargin: Style.marginM
              columns: 3
              columnSpacing: Style.marginM

              NText { Layout.preferredWidth: 100; text: "Mode";    font.weight: Font.Bold; color: Color.mOnSurfaceVariant; pointSize: Style.fontSizeS }
              NText { Layout.preferredWidth: 160; text: "Keymap";  font.weight: Font.Bold; color: Color.mOnSurfaceVariant; pointSize: Style.fontSizeS }
              NText { Layout.fillWidth: true;     text: "Function"; font.weight: Font.Bold; color: Color.mOnSurfaceVariant; pointSize: Style.fontSizeS }
            }

            // Trennlinie
            Rectangle {
              Layout.fillWidth: true
              height: 1
              color: Color.mOutlineVariant
            }

            // Daten-Zeilen
            Repeater {
              model: itemsModel

              delegate: GridLayout {
                Layout.fillWidth: true
                Layout.leftMargin: Style.marginL
                Layout.rightMargin: Style.marginL
                Layout.topMargin: Style.marginS
                Layout.bottomMargin: Style.marginS
                columns: 3
                columnSpacing: Style.marginM

                NText { Layout.preferredWidth: 100; text: model.mode; color: Color.mOnSurfaceVariant; pointSize: Style.fontSizeS }
                NText { Layout.preferredWidth: 160; text: model.map;  color: Color.mOnSurface;        pointSize: Style.fontSizeS; font.family: "monospace" }
                NText { Layout.fillWidth: true;     text: model.fun;  color: Color.mOnSurface;        pointSize: Style.fontSizeS }
              }
            }
          }
        }
      }
    }
  }
}
