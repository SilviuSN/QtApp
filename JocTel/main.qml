import QtQuick
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root
    property alias stack: stackView

    width: 640
    height: 480
    visible: true

    StackView {
        id: stackView
        initialItem: "MainMenu.qml"
        anchors.fill: parent
    }
}
