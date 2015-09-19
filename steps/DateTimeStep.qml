import QtQuick 2.0
import Setting 1.0
import "../util.js" as Util
import ".." as Core

Core.WizardStep {
  function isValid() {
    var d = new Date(year, month - 1, day - 1, hour, minute);
    return d.getFullYear() === year.value &&
        d.getMonth() === month- 1 &&
        d.getDate() === day- 1 &&
        d.getHours() === hour&&
        d.getMinutes() === minute;
  }

  valid: isValid()

  property int year: parseInt(yearText)
  property int month: parseInt(monthText)
  property int day: parseInt(dayText)
  property int hour: parseInt(hourText)
  property int minute: parseInt(minuteText)

  onSave: {
    if(valid) {
      var d = new Date(year.value, month.value - 1, day.value - 1, hour.value, minute.value);
      setting.value = Qt.formatDateTime(d, "yyyy-MM-ddThh:mm:ss");
      setting.write();
    }
  }

  Setting {
    id: setting
    script: "scripts/datetime.sh"
    property date date: new Date(value)
  }

  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      text: "Please enter the current date and time"
    }

    Column {
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      spacing: 18

      Row {
        Core.PyraInputField {
          id: yearText
          width: 100
          focus: true
          inputMask: "9999"
          text: setting.date.getFullYear()
        }
        Core.PyraText {
          text: "-"
        }
        Core.PyraInputField {
          id: monthText
          width: 75
          inputMask: "09"
          text: Util.zeroPad(setting.date.getMonth() + 1, 2)
        }
        Core.PyraText {
          text: "-"
        }
        Core.PyraInputField {
          id: dayText
          width: 75
          inputMask: "09"
          text: Util.zeroPad(setting.date.getDate() + 1, 2)
        }
      }

      Row {
        Core.PyraInputField {
          id: hourText
          width: 75
          inputMask: "09"
          text: Util.zeroPad(setting.date.getHours(), 2)
        }
        Core.PyraText {
          text: ":"
        }
        Core.PyraInputField {
          id: minuteText
          width: 75
          inputMask: "09"
          text: Util.zeroPad(setting.date.getMinutes(), 2)
        }

      }

    }
  }
}
