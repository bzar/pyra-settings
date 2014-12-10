import QtQuick 2.0

Rectangle {
  default property alias content: container.children
  color: "#dedcdc"

  Item {
    id: container
    anchors.fill: parent
    anchors.leftMargin: 60
    anchors.rightMargin: 135
    anchors.topMargin: 35
    anchors.bottomMargin: 100

  }
}
