#ifndef SETTINGPLUGIN_H
#define SETTINGPLUGIN_H

#include <QQmlExtensionPlugin>
class SettingPlugin : public QQmlExtensionPlugin
{
  Q_OBJECT
  Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
  void registerTypes(const char *uri);
};

#endif // SETTINGPLUGIN_H
