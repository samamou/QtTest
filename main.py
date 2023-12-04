# This Python file uses the following encoding: utf-8
# this will be used to interface the QML code with python to generate JSON

#https://www.pythonguis.com/tutorials/pyside6-qml-qtquick-python-application/
#https://doc.qt.io/qtforpython-6/tutorials/basictutorial/signals_and_slots.html

import sys
import json
import os
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from PySide6.QtCore import Slot

#create slot 
@Slot(str, float, str)

def create_json_config(name, slide, config_json):
    config_data = {
        "name" : name,
        "slide" : slide, 
        "name " : json.loads(config_json)
    }
    with open('config.json', 'w') as file:
        json.dump(config_data, file, indent=4)
    print("Configuration saved to config.json")

# QML app 
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).resolve().parent / "./qml/simpleUI.qml"
    engine.load(qml_file)
    
    # Get the root QML object (ApplicationWindow)
    root = engine.rootObjects()[0]

    # Connect the QML signal to the Python slot
    root.saveConfig.connect(create_json_config) 
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
