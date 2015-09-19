import QtQuick 2.0
import ".." as Core

Core.WizardStep {
  property alias password: input.text
  valid: input.text.length > 0 && input.text === repeat.text
  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      text: "Enter a password for your account."
    }

    Column {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      spacing: 18
      Core.PyraInputField {
        id: input
        label: "Password:"
        password: true
        width: parent.width
        focus: true
      }

      Core.PyraInputField {
        id: repeat
        label: "Confirm password:"
        password: true
        width: parent.width
      }
    }
  }
}
