import QtQuick 2.0
import QtGraphicalEffects 1.0

FocusScope {
  default property alias content: content.children
  property alias title: title.text
  property bool active: false
  property bool activatable: true
  property bool valid: true

  signal save()

  opacity: active ? 1.0 : 0.0

  Behavior on opacity {
    NumberAnimation {
      duration: 1000
      easing.type: Easing.InOutExpo
    }
  }

  Item {
    id: content
    anchors.fill: parent
    visible: blur.radius == 0
    Text {
      id: title
      visible: text.length > 0
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.margins: 16
      color: "#fff"
      font.bold: true
      font.pixelSize: 48
      font.family: "sans-serif"
    }
  }

  FastBlur {
    id: blur
    anchors.fill: parent
    source: content
    radius: active ? 0 : 256
    visible: radius > 0 && (content.children.length > 1 || title.text.length > 0)

    Behavior on radius {
      NumberAnimation {
        duration: 1000
        easing.type: Easing.InOutExpo
      }
    }
  }
}
