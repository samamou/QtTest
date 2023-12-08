//Simple UI
//create text inputs, dropdows, sliders, to capture user input (Quick Controls)
//group related config parameters together
//TODO: Validate User Input? make sure config data isn't empty

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts // Import for layouts

//QML
ApplicationWindow {
    // signal configDataChanged(string name, real slide)
    signal saveConfig(string name, real slide, string config_json)

    width: 640
    height: 480
    visible: true
    title: "Simple UI"
    // Your UI components will go here

    Rectangle {
        anchors.fill: parent //https://doc.qt.io/qt-6/qtquick-positioning-anchors.html

        // bg
        Image {
            anchors.fill: parent
            source: "../images/bg.png"       
        }

        //logo
        Image {
        id: logoImage
        anchors.top: parent.top
        anchors.left: parent.left 
        width: 50
        height: 50    
        source: "../images/LivePose_logo.png" 
        anchors.margins: 20 // Adjust for padding from the edges
        }    

   
    }

    Column {
        spacing: 40
        anchors.centerIn: parent

        TextField {
            id: name
            width: 200 
            placeholderText: "Enter configuration name"
        }

        Text {
            text: "Minimum Detection Threshold"
            Slider {
                id: slider
            }
        }

        ComboBox {
            id: backendSelector
            model: ["mediapipe", "posenet", "mmpose", "trt", "void"]
        }


        Button {
            text: "Save"

                onClicked: {
                    // Collect all the data from the UI elements
                    var configData = {
                        "backend": backendSelector.currentText
                        
                    };
                    //bind the Save button to the saveConfig signal 
                    saveConfig(name.text, slider.value*10, JSON.stringify(configData));

            }
            
        }

    }
}



