import QtQuick 2.0
import ".." as Core

Core.WizardStep {
  property alias username: input.text
  valid: input.text.length > 0

  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      text: "Does this thing work?\n\n\"Hellolo\" once again. This is the first-boot setup."
    }

    Column {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      spacing: 18
      Core.PyraInputField {
        id: input
        label: "User name:"
        width: parent.width
        focus: true
      }
    }
  }
}

