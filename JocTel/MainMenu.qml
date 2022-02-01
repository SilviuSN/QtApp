import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    Button {
        id: fotbalBtn

        width: 150
        height: 50
        anchors.centerIn: parent
        text: "Football"
        onClicked: root.stack.push("TerenFotbal.qml");
    }
    Button {
        id: basketBtn

        anchors {
            top: fotbalBtn.bottom
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        width: 150
        height: 50
        text: "Basketball"
        onClicked: root.stack.push("TerenBasket.qml");
    }

    Button {
        id: quitBtn

        anchors {
            top: basketBtn.bottom
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        width: 150
        height: 50
        text: "Quit"
        onClicked: Qt.quit()
    }
}
