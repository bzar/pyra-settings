import QtQuick 2.0

FocusScope {
  property alias label: label.text
  property alias text: input.text
  property alias inputMask: input.inputMask
  property bool password: false
  property alias validatable: validatableExtra.visible
  property bool valid: true
  property alias validExtra: validExtra.sourceComponent

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
    Item {
      anchors.left: parent.left
      anchors.right: parent.right
      height: childrenRect.height

      Rectangle {
        anchors.left: parent.left
        anchors.right: validatableExtra.left
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
      Row {
        id: validatableExtra
        visible: false
        opacity: valid ? 1 : 0
        width: visible ? ok.width + validExtra.width : 0
        height: parent.height
        anchors.right: parent.right

        Text {
          id: ok
          text: "OK"
          color: "green"
          font.pixelSize: input.font.pixelSize
          font.weight: Font.ExtraBold
        }
        Loader {
          id: validExtra
          width: childrenRect.width
        }
      }
    }
  }
}
