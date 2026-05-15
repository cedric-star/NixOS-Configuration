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
    ListElement { mode: "normal"; map: "ss s"; fun: "nix alla" }
    ListElement { mode: "normal"; map: "ss s"; fun: "nix alla" }
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
