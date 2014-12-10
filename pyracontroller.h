#ifndef PYRACONTROLLER_H
#define PYRACONTROLLER_H

#include <QObject>
#include "qevdev.h"
#include "evdevdevicelistmodel.h"

class PyraController : public QObject
{
  Q_OBJECT
public:
  explicit PyraController(QObject *parent = 0);

signals:
  void left(bool);
  void right(bool);
  void up(bool);
  void down(bool);
  void a(bool);
  void b(bool);
  void x(bool);
  void y(bool);
  void zztop(bool);
  void zzbottom(bool);
  void l1(bool);
  void r1(bool);
  void l2(bool);
  void r2(bool);
  void pyra(bool);
  void select(bool);
  void start(bool);
  void nublx(int);
  void nubly(int);
  void nubrx(int);
  void nubry(int);

public slots:

private slots:
  void updateDevices();
  void updateDevice(QEvdev& device, QString deviceName);
  void buttonsKeyEvent(int, int);
  void nub0AbsEvent(int, int);
  void nub1AbsEvent(int, int);

private:
  QString findDevicePath(QString deviceName);

  QEvdev _buttons;
  QEvdev _nub0;
  QEvdev _nub1;

  EvdevDeviceListModel _devices;
};

#endif // PYRACONTROLLER_H
