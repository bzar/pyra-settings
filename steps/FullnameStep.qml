import QtQuick 2.0
import ".." as Core

Core.WizardStep {
  property alias fullname: input.text
  valid: input.text.length > 0

  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      text: "Please enter your full name"
    }

    Column {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      spacing: 18
      Core.PyraInputField {
        id: input
        label: "Full name:"
        width: parent.width
        focus: true
      }
    }
  }
}
