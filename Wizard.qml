import QtQuick 2.0

Item {
  default property alias steps: stepContainer.children
  property alias selectedIndex: view.selectedIndex
  property alias selected: view.selected
  property bool canNext: selected.valid && selectedIndex + 1 < steps.length && steps[selectedIndex + 1].activatable
  property bool canPrev: selectedIndex - 1 >= 0 && steps[selectedIndex - 1].activatable

  function next() {
    if(canNext) {
      selected.save()
      selectedIndex += 1;
    }
  }
  function prev() {
    if(canPrev) {
      selectedIndex -= 1;
    }
  }

  onSelectedChanged: selected.focus = true

  Item {
    id: view
    width: parent.width
    anchors.top: parent.top
    anchors.bottom: buttons.top
    anchors.bottomMargin: 18

    property int selectedIndex: 0
    property int prevSelectedIndex: 0
    property variant selected: steps[view.selectedIndex]
    property variant previous: steps[view.prevSelectedIndex]
    onSelectedChanged: {
      steps[view.prevSelectedIndex].active = false;
      selected.active = true;
      prevSelectedIndex = selectedIndex;
      x = -selectedIndex * width;
    }


    Behavior on x {
      NumberAnimation {
        duration: 1000
        easing.type: Easing.InOutExpo
      }
    }

    Item {
      id: stepContainer
      anchors.fill: parent

      function layout() {
        for(var i = 0; i < children.length; ++i) {
          var child = children[i];
          child.x = width * i;
          child.width = width;
          child.height = height;
        }
        selected.active = true;
      }
      Component.onCompleted: layout()
      onWidthChanged: layout()
      onHeightChanged: layout()
    }
  }

  Item {
    id: buttons
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: childrenRect.height
    Button {
      width: 360
      height: 72
      text: "Continue"
      onClicked: next()
      enabled: canNext
      anchors.right: parent.right
      anchors.margins: 6
    }
    Button {
      width: 360
      height: 72
      text: "Back"
      onClicked: prev()
      enabled: canPrev
      anchors.left: parent.left
      anchors.margins: 6
    }
  }


}
