import QtQuick
import QtQuick.Layouts

Item {
    id: root
    property var pluginApi

    // Daten: [Modus, Kürzel, Beschreibung]
    readonly property var rows: [
        ["",        "",              "── MODI ──────────────────────"],
        ["insert",  "ii",            "Normal → Insert"],
        ["normal",  "nn",            "Insert → Normal"],
        ["normal",  "m",             "Normal → Visual"],
        ["visual",  "esc",           "Visual → Normal"],
        ["",        "",              "── NAVIGATION ────────────────"],
        ["n/v/o",   "j k l ö",       "← → ↓ ↑"],
        ["normal",  "Ctrl ←→↓↑",    "Fenster wechseln"],
        ["",        "",              "── CLIPBOARD ─────────────────"],
        ["n/v",     "c",             "Kopieren  (= y)"],
        ["n/v",     "x",             "Ausschneiden  (= d)"],
        ["n/v",     "v",             "Einfügen nach Cursor  (= p)"],
        ["",        "",              "── SUCHEN & ERSETZEN ─────────"],
        ["command", "s/alt/neu/",    "Ersetzen in aktueller Zeile"],
        ["command", "%s/alt/neu/",   "Ersetzen in gesamter Datei"],
        ["command", ":%s/a/n/gc",    "Ersetzen mit Bestätigung"],
        ["",        "",              "── SPRINGEN ──────────────────"],
        ["command", ":42",           "Zu Zeile 42 springen"],
        ["normal",  "10k / 10l",     "10 Zeilen runter / hoch"],
        ["",        "",              "── ALLGEMEIN ─────────────────"],
        ["n/i",     "Ctrl z",        "Undo"],
        ["n/i",     "Ctrl y",        "Redo"],
        ["n/i",     "Ctrl s",        "Datei speichern"],
        ["normal",  "Space qq",      "Alle Fenster schließen"],
        ["normal",  "Space wd",      "Aktuelles Fenster schließen"],
        ["normal",  "Space -",       "Fenster horizontal teilen"],
        ["normal",  "Space |",       "Fenster vertikal teilen"],
    ]

    Rectangle {
        anchors.fill: parent
        color: Color.mSurface
        radius: Style.radiusL

        ColumnLayout {
            anchors { fill: parent; margins: Style.marginL }
            spacing: 0

            NText {
                text: "Neovim Cheatsheet"
                font.pixelSize: Style.fontSizeL
                font.bold: true
                color: Color.mOnSurface
                Layout.bottomMargin: Style.marginM
            }

            // Tabellenkopf
            RowLayout {
                spacing: 0
                Layout.fillWidth: true

                Rectangle {
                    width: 70;  height: 24
                    color: Color.mSurfaceVariant; radius: 4
                    NText { anchors.centerIn: parent; text: "Modus"
                            color: Color.mOnSurfaceVariant; font.pixelSize: Style.fontSizeS }
                }
                Item { width: Style.marginS }
                Rectangle {
                    width: 130; height: 24
                    color: Color.mSurfaceVariant; radius: 4
                    NText { anchors.centerIn: parent; text: "Kürzel"
                            color: Color.mOnSurfaceVariant; font.pixelSize: Style.fontSizeS }
                }
                Item { width: Style.marginS }
                Rectangle {
                    Layout.fillWidth: true; height: 24
                    color: Color.mSurfaceVariant; radius: 4
                    NText { anchors { left: parent.left; leftMargin: 8; verticalCenter: parent.verticalCenter }
                            text: "Beschreibung"
                            color: Color.mOnSurfaceVariant; font.pixelSize: Style.fontSizeS }
                }
            }

            Item { height: Style.marginS }

            // Zeilen
            Repeater {
                model: root.rows
                delegate: Item {
                    Layout.fillWidth: true
                    height: modelData[0] === "" ? 28 : 24

                    // Trennzeile / Abschnittsüberschrift
                    NText {
                        visible: modelData[0] === ""
                        anchors { left: parent.left; verticalCenter: parent.verticalCenter }
                        text: modelData[2]
                        color: Color.mPrimary
                        font.pixelSize: Style.fontSizeS
                        font.bold: true
                    }

                    // Normale Zeile
                    RowLayout {
                        visible: modelData[0] !== ""
                        anchors.fill: parent
                        spacing: 0

                        // Modus-Badge
                        Rectangle {
                            width: 70; height: 20
                            color: Color.mSecondaryContainer; radius: 4
                            NText {
                                anchors.centerIn: parent
                                text: modelData[0]
                                color: Color.mOnSecondaryContainer
                                font.pixelSize: Style.fontSizeXS
                                font.family: "monospace"
                            }
                        }
                        Item { width: Style.marginS }

                        // Kürzel
                        Rectangle {
                            width: 130; height: 20
                            color: Color.mSurfaceContainer; radius: 4
                            NText {
                                anchors { left: parent.left; leftMargin: 6; verticalCenter: parent.verticalCenter }
                                text: modelData[1]
                                color: Color.mOnSurface
                                font.pixelSize: Style.fontSizeS
                                font.family: "monospace"
                                font.bold: true
                            }
                        }
                        Item { width: Style.marginS }

                        // Beschreibung
                        NText {
                            Layout.fillWidth: true
                            text: modelData[2]
                            color: Color.mOnSurfaceVariant
                            font.pixelSize: Style.fontSizeS
                            elide: Text.ElideRight
                        }
                    }
                }
            }
        }
    }
}
