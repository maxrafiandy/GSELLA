import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QEnum 1.0

Page {
    id: root
    padding: 20

    property string titlepage

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

            Label {
                text: "JENIS PULSA:"
            }

            ComboBox {
                id: jenis_pulsa
                Layout.fillWidth: true
                font.weight: Font.Light
                model: ["PULSA TELEPON", "DATA INTERNET"]
            }

            Label {
                text: "JUMLAH:"
            }

            ComboBox {
                id: jumlah
                Layout.fillWidth: true
                font.weight: Font.Light
                currentIndex: 0
                model: {
                    if (jenis_pulsa.currentIndex == 0) {
                        ["Rp.5,000", "Rp.10,000", "Rp.20,000", "Rp.50,000", "Rp.100,000"]
                    } else {
                        ["2 GB", "4 GB", "8 GB", "11 GB"]
                    }
                }
            }

            Label {
                text: "NOMOR TELEPON:"
            }

            TextField {
                id: nohp
                Layout.fillWidth: true
                font.weight: Font.Light
                font.italic: true
                validator: RegExpValidator {
                    regExp: /[0-9]+/
                }
                inputMethodHints: Qt.ImhDigitsOnly
                maximumLength: 12
                placeholderText: qsTr("Nomor handphone")
            }

            Button {
                Layout.fillWidth: true
                font.weight: Font.Light
                font.bold: true
                font.letterSpacing: 5
                text: qsTr("KIRIM")

                onClicked: {
                    var nominal = []
                    var pin = cfg_listener.slotGetPIN();
                    switch (jenis_pulsa.currentIndex)
                    {
                    case Enum.REGULER:
                        nominal = ["5", "10", "20", "50", "100"]
                        btn_listener.slotKirim(nominal[jumlah.currentIndex],nohp.text,pin,Enum.REGULER)
                        break
                    case Enum.KUOTA:
                        nominal = ["2", "4", "8", "11"]
                        btn_listener.slotKirim(nominal[jumlah.currentIndex],nohp.text,pin,Enum.KUOTA)
                        break
                    }
                }
            }
        }
    }
}
