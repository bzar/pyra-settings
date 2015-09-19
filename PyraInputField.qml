import QtQuick 2.0

FocusScope {
  property alias label: label.text
  property alias text: input.text
  property alias inputMask: input.inputMask
  property bool password: false
  height: column.height

  Column {
    id: column
    anchors.left: parent.left
    anchors.right: parent.right
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
        focus: true
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
}
