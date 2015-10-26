import QtQuick 2.0
import ".." as Core

Core.WizardStep {
  property alias username: username.text
  property alias fullname: fullname.text
  property alias password: password.text

  valid: username.valid && fullname.valid && password.valid && passwordRepeat.valid

  Core.PyraFrame {
    anchors.fill: parent

    Column {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      spacing: 18

      Core.PyraInputField {
        id: username
        label: "Which username would you like?"
        width: parent.width
        focus: true
        valid: text.length > 0
        validatable: true
      }
      Core.PyraInputField {
        id: fullname
        label: "..and what is your full name?"
        width: parent.width
        valid: text.length > 0
        validatable: true
      }
      Core.PyraInputField {
        id: password
        label: "What password would you like to use?"
        password: true
        width: parent.width
        valid: text.length > 0
        validatable: true
        validExtra: Text {
          text: "This password\nis very weak!"
          width: paintedWidth
        }
      }
      Core.PyraInputField {
        id: passwordRepeat
        label: "Enter your password again to confirm:"
        password: true
        width: parent.width
        valid: password.valid && password.text === text
        validatable: true
      }
    }
  }
}
