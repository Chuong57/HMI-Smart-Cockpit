

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Layouts
import QtQuick.Effects

// import QtGraphs
Rectangle {
    id: dashboardHSC
    width: 1920
    height: 1080
    color: Constants.backgroundColor
    // anchors.fill: parent
    // Component.onCompleted: {
    //     Service
    // }

    Rectangle {
        id: sideBar
        width: dashboardHSC.width / 3.5
        height: dashboardHSC.height - bottomBar.height
        color: "#000000"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Image {
            id: headLight
            anchors.top: sideBar.top
            anchors.right: sideBar.right
            anchors.rightMargin: 10
            height: sideBar.height / 18
            source: "Resources/images/lights_off.png"

            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseAreaHeadLight
                anchors.fill: headLight

                onPressed: {
                    lightController.setLightControl(!lightController.lightControl)
                }
            }
            Connections {
                target: lightController
                function onLightControlChanged() {
                    headLight.source = lightController.lightControl ? "Resources/images/lights_on.png" : "Resources/images/lights_off.png"
                }
            }
        }

        Text {
            id: currentSpeed
            width: sideBar.width
            height: sideBar.height / 12
            anchors.top: sideBar.top
            anchors.topMargin: headLight.height
            font.pixelSize: height
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
            font.bold: true
            color: "white"
            text: qsTr("40")
        }

        Label {
            id: unitLabel
            width: sideBar.width
            height: sideBar.height / 40
            anchors.top: currentSpeed.bottom
            anchors.topMargin: 3
            color: "#858585"
            text: qsTr("KM/H")
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: height / 1.8
            font.family: "Arial"
            // font.bold: true
        }

        Image {
            id: batteryIcon
            height: sideBar.height / 30
            width: sideBar.width / 10
            y: unitLabel.y - 3
            anchors.right: sideBar.right
            source: "Resources/images/full_battery.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: currentBattery
            width: sideBar.width
            height: sideBar.height / 40
            anchors.top: currentSpeed.bottom
            anchors.topMargin: 3
            anchors.right: batteryIcon.left
            anchors.rightMargin: 0
            color: "#858585"
            text: "318" + " mi"
            horizontalAlignment: Text.AlignRight
            font.pointSize: height / 1.8
            font.family: "Arial"
            // font.bold: true
        }

        // The bold edge or bottom border
        Rectangle {
            id: bottomLine
            width: parent.width
            height: currentSpeed.height / 40 // Adjust height to make the line as bold as needed
            color: "#858585" // Same color as the text or change to any color
            anchors.top: unitLabel.bottom
            anchors.topMargin: 2.5
        }

        Rectangle {
            id: bottomCenterLine
            width: parent.width / 15
            height: currentSpeed.height / 12 // Adjust height to make the line as bold as needed
            color: "#2c9f03" // Same color as the text or change to any color
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.verticalCenter: parent.verticalCenter
            anchors.top: unitLabel.bottom
            anchors.topMargin: 1
            radius: 5
        }

        Rectangle {
            width: parent.width / 10 // Width of the rectangle
            height: parent.height / 13 // Height of the rectangle
            color: "white" // Background color of the rectangle
            border.color: "black" // Optional: border color
            border.width: 1 // Optional: border width
            // radius: 5            // Optional: corner radius for rounded edges
            anchors.top: bottomLine.bottom
            anchors.right: parent.right
            Column {
                // anchors.fill: parent // Make the column fill the rectangle
                width: parent.width // Same width as the rectangle
                // height: 60         // Fixed height for the column
                anchors.top: parent.top
                anchors.topMargin: 3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter // Center the column vertically
                // First line of text
                Text {
                    text: "SPEED\nLIMIT"
                    font.pixelSize: parent.width / 4 // Size of the first line of text
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "black" // Text color
                }

                // Second line of text
                Text {
                    text: "80"
                    font.pixelSize: parent.width / 2 // Size of the second line of text
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "black" // Text color
                }
            }
        }

        Item {
            id: speedItem
            width: parent.width
            height: parent.height / 10
            anchors.top: bottomLine.bottom
            anchors.topMargin: 5
            // Property to store and control speed value
            // property int speed: 30

            Connections {
                target: speedController
                function onCarSpeedChanged() {
                    // to do something
                }
            }

            // Circle with the speed text inside
            Rectangle {
                id: speedCircle
                width: parent.width / 8
                height: width
                radius: width / 2
                color: "transparent" // Transparent to only show the border
                border.color: "#858585" // Edge color
                border.width: 3 // 5-pixel thick edge
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                // Text displaying the speed inside the circle
                Text {
                    id: speedText
                    text: speedController.carSpeed
                    font.pixelSize: parent.height / 1.7 // Adjust to fit text inside the circle
                    anchors.centerIn: parent
                    color: "#858585"
                    font.bold: false
                }
            }

            // Minus button on the left side of the circle
            Rectangle {
                id: minusButton
                width: speedCircle.width / 2
                height: width
                radius: width / 2
                color: "black"
                anchors.right: speedCircle.left
                anchors.rightMargin: 10
                anchors.verticalCenter: speedCircle.verticalCenter
                Text {
                    text: "-"
                    font.pixelSize: speedText.font.pixelSize
                    anchors.centerIn: parent
                    color: "#858585"
                    font.bold: false
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        speedController.increaseCarSpeed(-1)

                    }
                }

            }

            // Plus button on the right side of the circle
            Rectangle {
                id: plusButton
                width: speedCircle.width / 2
                height: width
                radius: width / 2
                color: "black"
                anchors.left: speedCircle.right
                anchors.leftMargin: 10
                anchors.verticalCenter: speedCircle.verticalCenter
                Text {
                    text: "+"
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    color: "#858585"
                    font.bold: false
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        speedController.increaseCarSpeed(1)

                    }
                }
            }
        }

        Image {
            id: xanhsm_car
            anchors.top: speedItem.bottom
            anchors.topMargin: parent.height / 5
            width: parent.width / 1.2
            anchors.horizontalCenter: parent.horizontalCenter
            source: "Resources/images/xanhsm_car.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: rightScreen
        // x: 339
        width: dashboardHSC.width - sideBar.width
        height: sideBar.height
        color: "#000000"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.topMargin: 0

        Image {
            id: lockIcon
            width: parent.width / 35
            height: 18
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 10
            source: "Resources/images/lock.png"
            fillMode: Image.PreserveAspectFit
            z: 1
        }
        Image {
            id: bluetoothIcon
            width: parent.width / 35
            anchors.left: lockIcon.right
            anchors.top: parent.top
            anchors.margins: 10
            anchors.leftMargin: 20
            anchors.topMargin: 10
            source: "Resources/images/bluetooth.png"
            fillMode: Image.PreserveAspectFit
            z: 1
        }
        Image {
            id: fourGIcon
            // x: 89
            width: parent.width / 35
            anchors.left: bluetoothIcon.right
            anchors.top: parent.top
            anchors.margins: 10
            anchors.leftMargin: 20
            anchors.topMargin: 9
            source: "Resources/images/4g.png"
            fillMode: Image.PreserveAspectFit
            z: 1
        }

        Text {
            id: currentTemp
            font.pixelSize: 20
            anchors.right: currentTime.left
            anchors.top: parent.top
            anchors.margins: 10
            color: "white" // Set the text color to white
            text: qsTr("17°C")
            z: 1
        }

        Text {
            id: currentTime
            font.pixelSize: 20
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 10
            color: "white" // Set the text color to white
            text: Qt.formatDateTime(new Date(), "hh:mm A")
            z: 1
        }

        Timer {
            id: currentTimeTimer
            interval: 1000 // 1 second
            running: true
            repeat: true
            onTriggered: currentTime.text = Qt.formatDateTime(new Date(),
                                                              "hh:mm A")
        }

        Plugin {
            id: mapPlugin
            name: "osm"
        }

        Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(10.76, 106.66)
            zoomLevel: 14
            property geoCoordinate startCentroid

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                                     map.startCentroid = map.toCoordinate(
                                                 pinch.centroid.position, false)
                                 }
                onScaleChanged: delta => {
                                    map.zoomLevel += Math.log2(delta)
                                    map.alignCoordinateToPoint(
                                        map.startCentroid,
                                        pinch.centroid.position)
                                }
                onRotationChanged: delta => {
                                       map.bearing -= delta
                                       map.alignCoordinateToPoint(
                                           map.startCentroid,
                                           pinch.centroid.position)
                                   }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
            WheelHandler {
                id: wheel
                // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
                // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
                // and we don't yet distinguish mice and trackpads on Wayland either
                acceptedDevices: Qt.platform.pluginName === "cocoa"
                                 || Qt.platform.pluginName
                                 === "wayland" ? PointerDevice.Mouse
                                                 | PointerDevice.TouchPad : PointerDevice.Mouse
                rotationScale: 1 / 120
                property: "zoomLevel"
            }
            DragHandler {
                id: drag
                target: null
                onTranslationChanged: delta => map.pan(-delta.x, -delta.y)
            }
            Shortcut {
                enabled: map.zoomLevel < map.maximumZoomLevel
                sequence: StandardKey.ZoomIn
                onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
            }
            Shortcut {
                enabled: map.zoomLevel > map.minimumZoomLevel
                sequence: StandardKey.ZoomOut
                onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
            }
        }

        Rectangle {
            id: musicBar
            color: "black"

            radius: width / 80
            anchors.bottom: rightScreen.bottom
            width: rightScreen.width / 1.03
            height: rightScreen.height / 5.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: height / 10

            Image {
                id: sourceGoneAva
                source: "Resources/images/music_gone.jpg"
                anchors.left: musicBar.left
                height: musicBar.height
                width: height
                visible: false
            }

            MultiEffect {
                source: sourceGoneAva
                anchors.fill: sourceGoneAva
                maskEnabled: true
                maskSource: mask
            }

            Item {
                id: mask
                width: sourceGoneAva.width
                height: sourceGoneAva.height
                layer.enabled: true
                visible: false

                Rectangle {
                    width: sourceGoneAva.width
                    height: sourceGoneAva.height
                    radius: width / 9
                    color: "black"
                }
            }

            Rectangle {
                id: playingSong
                width: musicBar.width / 4
                height: musicBar.height / 1.2
                color: "transparent"
                anchors.left: sourceGoneAva.right
                anchors.leftMargin: width / 10
                anchors.verticalCenter: parent.verticalCenter
                Column {
                    anchors.left: sourceGoneAva.right
                    anchors.leftMargin: 15
                    anchors.top: musicBar.top
                    anchors.topMargin: 10

                    Text {
                        text: "GONE"
                        color: "#FFFFFF"
                        font.pointSize: musicBar.height / 6
                        font.bold: false
                    }

                    Text {
                        text: "Rosé"
                        color: "#8f8f8f"
                        font.pointSize: musicBar.height / 7
                    }
                }

                Image {
                    id: likeIcon
                    source: "Resources/images/like.png"
                    width: height
                    height: musicBar.height / 5
                    anchors.right: playingSong.right
                    // anchors.rightMargin: 20
                    anchors.top: playingSong.top
                    anchors.topMargin: 5
                }

                ProgressBar {
                    id: playingProgressTime
                    value: 0.2
                    anchors.bottom: playingSong.bottom
                    height: playingSong.height / 40
                    width: playingSong.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8

                    background: Rectangle {
                        anchors.fill: parent
                        color: "#b3d9ff"
                        radius: height / 4
                        // border.width: 0
                    }

                    contentItem: Rectangle {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height
                        width: parent.width
                               * playingProgressTime.value // Set width based on ProgressBar value
                        color: "#1aa3ff"
                        radius: height / 4
                    }
                }

                // Time labels
                Row {
                    id: timeRow
                    anchors.bottom: playingProgressTime.top
                    anchors.bottomMargin: 2
                    // anchors.horizontalCenter: progressSlider.horizontalCenter
                    height: playingSong.height / 9
                    width: playingProgressTime.width

                    Text {
                        text: "2:45"
                        color: "#8f8f8f"
                        font.pointSize: timeRow.height / 1.1
                        anchors.left: timeRow.left
                        anchors.bottom: timeRow.bottom
                    }

                    Text {
                        text: "4:58"
                        color: "#8f8f8f"
                        font.pointSize: timeRow.height / 1.1
                        anchors.right: timeRow.right
                        anchors.bottom: timeRow.bottom
                    }
                }
            }

            // Play controls
            Row {
                spacing: musicBar.width / 15
                // anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: playingSong.right
                anchors.leftMargin: musicBar.width / 10

                Image {
                    source: "Resources/images/previous_song.png"
                    width: height
                    height: musicBar.height / 4.5
                }

                Image {
                    source: "Resources/images/pause.png"
                    width: height
                    height: musicBar.height / 4.5
                }

                Image {
                    source: "Resources/images/next_song.png"
                    width: height
                    height: musicBar.height / 4.5
                }

                Image {
                    source: "Resources/images/search.png"
                    width: height
                    height: musicBar.height / 4.5
                }

                Image {
                    source: "Resources/images/eject.png"
                    width: height
                    height: musicBar.height / 4.5
                }
            }
        }
    }

    Rectangle {
        id: bottomBar
        // y: 533
        height: dashboardHSC.height / 10
        color: "#161616"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Row {
            id: row
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 60
            Image {
                id: carIcon
                // width: parent.width / 20
                // height: parent.height / 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 15
                anchors.verticalCenter: bottomBar.verticalCenter
                height: parent.height / 2
                source: "Resources/images/car.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: bluetoothBottomIcon
                source: "Resources/images/bluetooth.png"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 15
                anchors.leftMargin: parent.width / 8 - carIcon.width - carIcon.anchors.leftMargin

                anchors.rightMargin: 0
                // anchors.verticalCenter: bottomBar.verticalCenter
                anchors.left: carIcon.right
                width: parent.width / 4
                height: parent.height / 2.5
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: musicIcon
                source: "Resources/images/music.png"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 20
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.verticalCenter: bottomBar.verticalCenter
                anchors.left: bluetoothBottomIcon.right
                width: parent.width / 4
                height: parent.height / 2.5
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: phoneIcon
                source: "Resources/images/phone.png"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 20
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: musicIcon.right
                width: parent.width / 4
                height: parent.height / 2.5
                fillMode: Image.PreserveAspectFit
            }

            RowLayout {
                // anchors.centerIn: parent
                spacing: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: parent.width / 8
                height: parent.height

                Connections {
                    target: audioController
                    function onVolumeLevelChanged() {
                        volumeIcon.visible = false
                        visibleVolumeTextTimer.stop()
                        visibleVolumeTextTimer.start()
                    }
                }

                Timer {
                    id: visibleVolumeTextTimer
                    interval: 1000
                    repeat: flase
                    onTriggered: {
                        volumeIcon.visible = true
                    }
                }

                // Volume Image next to the arrows
                Image {
                    id: volumeIcon
                    source: "Resources/images/volume.png"
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.right: columnUpDown.left
                    anchors.rightMargin: 8
                    fillMode: Image.PreserveAspectFit
                    // Layout.alignment: Qt.AlignVCenter
                    width: musicIcon.width / 8
                    height: musicIcon.height
                }
                // Column for up and down arrow buttons
                ColumnLayout {
                    id: columnUpDown
                    spacing: 0 // No spacing between the buttons
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    width: phoneIcon.width / 8
                    // Up Arrow (with MouseArea)
                    Image {
                        id: upButton
                        source: "Resources/images/up.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.width
                        height: columnUpDown.height / 4
                        anchors.top: columnUpDown.top
                        anchors.topMargin: 5
                        MouseArea {
                            id: mouseAreaUp
                            anchors.fill: upButton

                            onPressed: {
                                audioController.increaseVolume(1);
                            }
                        }
                    }

                    // Down Arrow (with MouseArea)
                    Image {
                        id: downButton
                        source: "Resources/images/down.png"
                        fillMode: Image.PreserveAspectFit
                        width: columnUpDown.width
                        height: columnUpDown.height / 4
                        anchors.bottom: columnUpDown.bottom
                        anchors.bottomMargin: 5
                        MouseArea {
                            id: mouseAreaDown
                            anchors.fill: downButton

                            onPressed: {
                                audioController.increaseVolume(-1);
                            }
                        }
                    }
                }
                Text {
                    id: volumeText
                    visible: !volumeIcon.visible
                    color: "white"
                    font.pixelSize: 24
                    text: audioController.volumeLevel
                    anchors.centerIn: volumeIcon
                }
            }
        }
    }

    states: [
        State {
            name: "clicked"
        }
    ]
}
