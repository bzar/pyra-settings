import QtQuick 2.3
import Setting 1.0
import Pyra 1.0
import QtQuick.Controls 1.2
import "steps" as Steps

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

    Steps.WelcomeStep {
      id: welcomeStep

    }
    Steps.FullnameStep {
      id: fullnameStep
    }

    Steps.UsernameStep {
      id: usernameStep
      function suggestion() {
        var match = /\w+/.exec(fullnameStep.fullname);
        return match !== null ? match[0].toLowerCase() : "";
      }

      username: suggestion()
    }

    Steps.PasswordStep {
      id: passwordStep

    }

    Steps.HostnameStep {
      id: hostnameStep
      function suggestion() {
        return usernameStep.username + "-pyra";
      }

      hostname: suggestion()
    }

    Steps.TimezoneStep {
      id: timezoneStep
    }

    Steps.DateTimeStep {
      id: datetimeStep
    }

  }
}
