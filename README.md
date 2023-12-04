# Qt Test

The Python script sets up a Qt application that interfaces with a QML-defined UI. 

The Qt UI collects user inputs, which the Python (backend) script then captures to create and save a JSON config file.

<img width="653" alt="Screen Shot 2023-12-04 at 5 34 20 PM" src="https://github.com/samamou/QtTest/assets/46803937/e8739128-e704-4d43-bf47-631bdc6b53c5">

https://github.com/samamou/QtTest/assets/46803937/ed302ead-5038-4724-9f51-d57b1c4c6c13

LivePose is a command line tool, the user changes config files by hand

Objective: Create a Qt/QMP User Interface for LivePose to generate JSON config files 

## Process

- install Qt, Qt Creator (interpreter: python3 compatible with Pyslide)

## Workflow

1. User enters a configuration in the UI
2. UI sends data to python (when does the ui trigger a python function?)
3. Python to generate JSON file
4. JSON file used in LivePose


### Questions 

Review https://www.qt.io/product/qt6/qml-book/ch04-qmlstart-core-elements

Install QSSEditor for layout design in vscode?

