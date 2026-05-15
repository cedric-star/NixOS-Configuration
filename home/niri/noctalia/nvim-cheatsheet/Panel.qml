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

          ListView {
            width: parent.width
            model: itemsModel
            spacing: Style.marginS

            delegate: Rectangle {
              width: ListView.view.width - Style.marginL * 2
              height: 60
              x: Style.marginL
              color: Color.mSurface
              radius: Style.radiusM

              RowLayout {
                anchors {
                  fill: parent
                  margins: Style.marginM
                }
                spacing: Style.marginM

                ColumnLayout {
                  Layout.fillWidth: true
                  spacing: Style.marginXS

                  NText {
                    text: model.mode
                    pointSize: Style.fontSizeM
                    font.weight: Font.Medium
                    color: Color.mOnSurface
                  }
                  NText {
                    text: model.map
                    pointSize: Style.fontSizeS
                    color: Color.mOnSurfaceVariant
                  }

                  NText {
                    text: model.fun
                    pointSize: Style.fontSizeS
                    color: Color.mOnSurfaceVariant
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}
