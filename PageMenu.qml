import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4


Page {
    id: root

    header: ToolBar {
        id: banner
        width: parent.width

        Rectangle {
            color: '#4286f4'
            anchors.fill: parent
        }

        Label {
            text: qsTr("GSELLA")
            font.letterSpacing: 5
            font.wordSpacing: 0
            font.bold: true
            font.pointSize: 18
            color: "white"
            anchors.centerIn: parent
        }
    }

    ListModel {
        id: model

        ListElement {
            label: "JUAL PULSA"
            page: "qrc:/PageJualPulsa.qml"
            icon: "images/ic_jualpulsa.png"
        }

        ListElement {
            label: "PENGATURAN"
            page: "qrc:/PagePengaturan.qml"
            icon: "images/ic_setting.png"
        }
    }


    ListView {
        id: pagelist
        width: parent.width
        height: parent.height
        model: model
        delegate: ItemDelegate {
            width: pagelist.width
            spacing: 5

            Image {
                id: listicon
                anchors.leftMargin: 10
                anchors.left: parent.left
                source: icon
                height: 30
                width: 30
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: listicon.right
                anchors.leftMargin: 10
                font.family: "Tahoma"
                text: label
            }

            Image {
                source: "images/ic_forward.png"
                height: 20
                width: 20
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
            }
            onClicked: root.StackView.view.push(page, {titlepage: label})
        }
    }
}
