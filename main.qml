import QtQuick 2.3
import Setting 1.0
import Battery 1.0
import Pyra 1.0
import QtQuick.Controls 1.2
import "steps" as Steps

ApplicationWindow {
  id: window
  width: 1280
  height: 720
  visible: true
  onClosing: Qt.quit()

  Image {
    anchors.fill: parent
    source: "img/background.png"
    fillMode: Image.PreserveAspectCrop
  }

  PyraController {

  }

  Battery {
    id: battery
    source: "/tmp/"
  }

  Wizard {
    id: wizard
    anchors.fill: parent
    anchors.leftMargin: 168
    anchors.rightMargin: 168
    anchors.topMargin: 32
    anchors.bottomMargin: 10
/*
    Steps.StartupStep {
      id: startupStep

    }
    Steps.WelcomeStep {
      id: welcomeStep

    }
    Steps.BatteryStep {
      id: batteryStep
    }
    Steps.PrimaryActionButtonStep {
      id: primaryActionButtonStep
    }
    Steps.UsageNotes {
      id: usageNotesStep
    }

    Steps.TimezoneStep {
      id: timezoneStep
    }

    Steps.DateTimeStep {
      id: datetimeStep
    }
*/
    Steps.UserStep {
      id: userStep
      function suggestion() {
        var match = /\w+/.exec(fullnameStep.fullname);
        return match !== null ? match[0].toLowerCase() : "";
      }
    }
  }
}
