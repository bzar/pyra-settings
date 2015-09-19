import QtQuick 2.0
import TimeZoneDataModel 1.0
import ".." as Core

Core.WizardStep {
  id: step
  property string area
  property string region

  Core.PyraFrame {
    anchors.fill: parent
    Core.PyraText {
      id: title
      text: "Select your time zone"
    }
    Rectangle {
      color: "#eee"
      radius: 8
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      anchors.top: title.bottom
      ListView {
        id: timeZoneList
        anchors.fill: parent
        anchors.leftMargin: parent.radius
        anchors.rightMargin: parent.radius
        clip: true
        focus: true
        model: TimeZoneDataModel {

        }

        function select(area, region) {
          var selectedIndex = model.find(area, region);
          positionViewAtIndex(selectedIndex, ListView.Center);
          currentIndex = selectedIndex;
        }

        section.property: "area"
        section.delegate: Text {
          width: timeZoneList.width
          text: section
          color: "#444"
          font.bold: true
          font.pixelSize: 20
          Rectangle {
            color: "#e00"
            height: 1
            width: parent.width
            anchors.bottom: parent.bottom
          }
        }

        delegate: Item {
          width: parent.width
          height: info.height

          MouseArea {
            anchors.fill: parent
            onClicked: {
              timeZoneList.currentIndex = index
              step.area = area;
              step.region = region;
            }
          }

          Row {
            id: info
            spacing: 16
            Text {
              id: regionText
              text: region
              font.pixelSize: 16
            }
            Text {
              text: "(" + comments + ")"
              visible: comments.length > 0
              anchors.baseline: regionText.baseline
            }
          }
        }
        highlightFollowsCurrentItem: true
        highlightMoveDuration: 500

        highlight: Rectangle {
          width: timeZoneList.width
          height: 20
          color: "#e77"
        }
      }
    }

  }
}
