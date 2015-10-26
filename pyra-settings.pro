TEMPLATE = app

QT += qml quick widgets
QTPLUGIN += qsvg
SOURCES += main.cpp \
    setting.cpp \
    timezonedatamodel.cpp \
    qevdev.cpp \
    pyracontroller.cpp \
    evdevdevicelistmodel.cpp \
    battery.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    setting.h \
    timezonedatamodel.h \
    qevdev.h \
    pyracontroller.h \
    evdevdevicelistmodel.h \
    battery.h

OTHER_FILES += \
    scripts/*
