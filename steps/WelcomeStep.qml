import QtQuick 2.0
import ".." as Core

Core.WizardStep {
  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      text: "Does this thing work?\n\n\"Hellolo\" once again. This is the first-boot setup."
    }
  }
}
