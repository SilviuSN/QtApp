import QtQuick
import QtQuick.Controls

Item {
    Image {
        id: imageBasketball
        anchors.fill: parent
        source: "qrc:/imagini/terenBasket.jpg"
        visible: true
    }

    Label {
        id: score
        text: "Your score is : " + internal.score
        font.bold: true
        font.pixelSize: 10
        color: "white"
    }

    Image {
        id: mingeBasket

        width: 50
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/imagini/mingeBasketball.png"
        visible: true

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked:  {
                goingUp.start()
                goingDown.stop()
                internal.score = internal.score + 1
            }
        }
    }

    Button {
        id: startBtn

        width: 150
        height: 50
        anchors.centerIn: parent
        text: "Start"
        onClicked: {
            startBtn.visible = false
            goingDown.start()
        }
    }

    NumberAnimation {
        id: goingUp
        target: mingeBasket
        properties: "y";
        from: mingeBasket.y
        to: mingeBasket.y - 100
        easing.type: Easing.OutCubic;
        duration: 400;
        onStopped: { goingDown.start() }
    }

    NumberAnimation {
        id: goingDown
        target: mingeBasket
        properties: "y";
        from: mingeBasket.y
        to: 520
        easing.type: Easing.OutCubic;
        duration: 2300;
        onFinished: dialog.visible = true
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        modal: true
        title: "Game Over"
        Label {
            text: "Ai primit " + internal.score + "puncte. Esti vai soarta ta"
            wrapMode: Text.WordWrap
        }

        standardButtons: Dialog.Ok

        onAccepted:
        {
            ScoreModel.insertNewScore(internal.score);
            root.stack.pop();
        }
    }

    QtObject {
        id: internal

        property int score: 0
    }
}
