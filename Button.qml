import QtQuick 2.3

Rectangle {
  property alias text: label.text
  property alias enabled: mouseArea.enabled
  property alias textColor: label.color

  signal clicked

  radius: height / 2
  color: "#7d89b2"
  Text {
    id: label
    anchors.centerIn: parent
    font.pixelSize: parent.height / 2
    font.family:  "serif"
    font.bold: true
    color: "#2d3140"
  }
  MouseArea {
    id: mouseArea
    anchors.fill: parent
    onClicked: parent.clicked()
  }
}
