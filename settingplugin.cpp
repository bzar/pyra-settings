#include "settingplugin.h"
#include "setting.h"

void SettingPlugin::registerTypes(const char* uri)
{
  // @uri fi.bzar.qmlcomponents
  qmlRegisterType<Setting>(uri, 1, 0, "Setting");
}
