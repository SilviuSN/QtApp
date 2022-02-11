import QtQuick
import QtQuick.Controls

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

    Label {
        id: scoreLabel
        width: 100
        height: 25
        anchors {
            left: parent.left;
            top: parent.top;
            topMargin: 100;
        }
        text: "High Scores:"
    }

    ListView {
        id: score
        width: 100;
        height: 100
        anchors {
            top:scoreLabel.bottom
            left:parent.left
        }
        model: ScoreModel.scoreList
        delegate: Text {
            text: ScoreModel.scoreList[index]
        }
    }
}
