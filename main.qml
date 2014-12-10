import QtQuick 2.3
import Setting 1.0
import Pyra 1.0
import QtQuick.Controls 1.2

ApplicationWindow {
  id: window
  width: 1280
  height: 720
  visible: true
  onClosing: Qt.quit()

  Rectangle {
    anchors.fill: parent
    color: "#000"
  }

  PyraController {

  }

  Wizard {
    anchors.fill: parent
    anchors.leftMargin: 168
    anchors.rightMargin: 168
    anchors.topMargin: 32
    anchors.bottomMargin: 10

    WizardStep {
      id: usernameStep

      PyraFrame {
        anchors.fill: parent
        PyraText {
          text: "Does this thing work?\n\n\"Hellolo\" once again. This is the first-boot setup."
        }

        Column {
          anchors.left: parent.left
          anchors.right: parent.right
          anchors.bottom: parent.bottom
          spacing: 18
          PyraInputField {
            label: "Password:"
            password: true
            width: parent.width
          }

          PyraInputField {
            label: "Confirm password:"
            password: true
            width: parent.width
          }
        }
      }
    }

    WizardStep {
      id: fullnameStep
    }
    WizardStep {
      id: passwordStep
    }
    WizardStep {
      id: timezoneStep
    }
    WizardStep {
      id: datetimeStep
    }

  }
}
