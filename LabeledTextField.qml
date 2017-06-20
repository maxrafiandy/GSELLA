import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Rectangle {
    property alias label: label.text
    property alias text: field.text
    property alias placeholder: field.placeholderText
    property alias echoMode: field.echoMode
    property alias inputMethodHints: field.inputMethodHints

    anchors.margins: 5
    height: 60
    Label {
        id: label
        text: "label"
        font.family: "Tahoma"
        width: parent.width
    }

    TextField {
        id: field
        anchors.top: label.bottom
        font.family: "Tahoma"
        width: parent.width
    }

}
