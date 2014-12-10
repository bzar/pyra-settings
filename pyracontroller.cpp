#include "pyracontroller.h"
#include <linux/input.h>

PyraController::PyraController(QObject *parent) :
  QObject(parent), _buttons(), _nub0(), _nub1(), _devices()
{
  updateDevices();
  connect(&_devices, SIGNAL(modelReset()), this, SLOT(updateDevices()));
  connect(&_buttons, SIGNAL(keyEvent(int,int)), this, SLOT(buttonsKeyEvent(int,int)));
  connect(&_nub0, SIGNAL(absEvent(int,int)), this, SLOT(nub0AbsEvent(int,int)));
  connect(&_nub1, SIGNAL(absEvent(int,int)), this, SLOT(nub1AbsEvent(int,int)));
}

void PyraController::updateDevices()
{
  updateDevice(_buttons, "gpio-keys");
  updateDevice(_nub0, "nub0");
  updateDevice(_nub1, "nub1");
}

void PyraController::updateDevice(QEvdev& device, QString deviceName)
{
  QString path = findDevicePath(deviceName);
  if(!path.isEmpty())
    device.setPath(path);
}

void PyraController::buttonsKeyEvent(int code, int value)
{
  switch(code)
  {
    case KEY_UP: emit up(value); break;
    case KEY_DOWN: emit down(value); break;
    case KEY_LEFT: emit left(value); break;
    case KEY_RIGHT: emit right(value); break;
    case KEY_HOME: emit a(value); break;
    case KEY_END: emit b(value); break;
    case KEY_PAGEUP: emit y(value); break;
    case KEY_PAGEDOWN: emit x(value); break;
    case KEY_INSERT: emit zztop(value); break;
    case KEY_DELETE: emit zzbottom(value); break;
    case KEY_RIGHTSHIFT: emit l1(value); break;
    case KEY_RIGHTCTRL: emit r1(value); break;
    case KEY_RIGHTALT: emit l2(value); break;
    case KEY_RIGHTMETA: emit r2(value); break;
    case KEY_LEFTALT: emit start(value); break;
    case KEY_LEFTCTRL: emit select(value); break;
    case KEY_MENU: emit pyra(value); break;
    default: break;
  }
}

void PyraController::nub0AbsEvent(int code, int value)
{
  switch(code)
  {
    case ABS_X: emit nublx(value); break;
    case ABS_Y: emit nubly(value); break;
    default: break;
  }

}

void PyraController::nub1AbsEvent(int code, int value)
{
  switch(code)
  {
    case ABS_X: emit nubrx(value); break;
    case ABS_Y: emit nubry(value); break;
    default: break;
  }
}

QString PyraController::findDevicePath(QString deviceName)
{
  for(int i = 0; i < _devices.rowCount(); ++i)
  {
    if(_devices.data(_devices.index(i), EvdevDeviceListModel::NameRole).toString() == deviceName) {
      return _devices.data(_devices.index(i), EvdevDeviceListModel::PathRole).toString();
    }
  }

  return "";
}
