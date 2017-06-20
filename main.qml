import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 640
    title: qsTr("GSELLA")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: PageMenu {}
    }
}
