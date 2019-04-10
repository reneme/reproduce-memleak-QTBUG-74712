import QtQuick 2
import QtQuick.Window 2
import QtQuick.Controls 2

Window {
  visible: true
  width: 320
  height: 240
  title: qsTr("Hello World")

  Button {
    id: "btn"

    text: "Show or Hide"

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true

      onEntered: { secondWindow.visible = !secondWindow.visible; }
      onExited: { secondWindow.visible = !secondWindow.visible; }
    }
  }

  Window {
    id: secondWindow
    width: 1600
    height: 600

    Image {
      source: "nom.jpg"
      // image credit:
      //   https://westergaard.eu/wp-content/uploads/2017/07/edorasware-illustration-memory-leak-horizontal.jpg
    }
  }
}
