import QtQuick 2.0

Column {
  property alias label: label.text
  property alias text: input.text
  property bool password: false

  spacing: 10
  PyraText {
    id: label
    font.italic: true
  }
  Rectangle {
    width: parent.width
    height: input.font.pixelSize + 16
    color: "#fafafa"
    TextInput {
      id: input
      anchors.fill: parent
      anchors.topMargin: 12
      anchors.bottomMargin: 4
      anchors.leftMargin: 16
      anchors.rightMargin: 16
      font.pixelSize: 30
      font.family: "sans"
      color: "#717ca1"
      echoMode: password ? TextInput.Password : TextInput.Normal
    }
  }
}
