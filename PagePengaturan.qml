import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Page {
    id: root
    property string titlepage
    padding: 20

    Component.onCompleted: {
        formatpulsa.text = cfg_listener.slotGetFormatPulsa()
        formatkuota.text = cfg_listener.slotGetFormatKuota()
        formatstok.text = cfg_listener.slotGetFormatCekStok()
        pin.text = cfg_listener.slotGetPIN()
    }

    header: ToolBar {
        id: banner
        width: parent.width
        Rectangle {
            color: '#4286f4'
            anchors.fill: parent
        }

        Image {
            id: menu
            source: "images/ic_backward.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: 25
            height: 25

            MouseArea {
                anchors.fill: parent
                onClicked: root.StackView.view.pop()
            }
        }

        Label {
            text: titlepage
            font.letterSpacing: 5
            font.wordSpacing: 0
            font.bold: true
            font.pointSize: 18
            color: "white"
            anchors.centerIn: parent
        }
    }

    Flickable {
        id: view
        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height

        ColumnLayout {
            id: content
            width: root.width - root.leftPadding - root.rightPadding
            spacing: 10

            Label {
                text: "FORMAT PULSA:"
            }

            TextField {
                id: formatpulsa
                Layout.fillWidth: true
            }

            Label {
                text: "FORMAT KUOTA:"
            }

            TextField {
                id: formatkuota
                Layout.fillWidth: true
            }

            Label {
                text: "FORMAT CEK STOK:"
            }

            TextField {
                id: formatstok
                Layout.fillWidth: true
            }

            Label {
                text: "PIN:"
            }

            TextField {
                id: pin
                Layout.fillWidth: true
                echoMode: TextInput.Password
                inputMethodHints: Qt.ImhDigitsOnly
                maximumLength: 4
                placeholderText: "~~ Masukkan Pin ~~"
            }

            Button {
                text: "SIMPAN"
                font.weight: Font.Light
                Layout.fillWidth: true
                onClicked: {
                    btn_listener.slotSaveConfig(formatpulsa.text,formatkuota.text,formatstok.text,pin.text)
                    root.StackView.view.pop()
                }
            }
        }
    }
}
