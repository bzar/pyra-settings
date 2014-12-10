#include "setting.h"
#include <QDebug>

Setting::Setting(QQuickItem* parent) : QQuickItem(parent),
  script(), values()
{
  connect(this, SIGNAL(scriptChanged(QString)), this, SLOT(read()));
}

QString Setting::getScript() const
{
  return script;
}

void Setting::setScript(const QString& newScript)
{
  if(script != newScript)
  {
    script = newScript;
    emit scriptChanged(script);
  }
}
QString Setting::getValue() const
{
  return values.isEmpty() ? "" : values.first();
}

void Setting::setValue(const QString& newValue)
{
  setValues(QStringList(newValue));
}
QStringList Setting::getValues() const
{
  return values;
}

void Setting::setValues(const QStringList& newValues)
{
  if(values != newValues)
  {
    values = newValues;
    emit valuesChanged(values);
    emit valueChanged(getValue());
  }
}

void Setting::read()
{
  qDebug() << "Reading setting";
  QProcess* process = new QProcess(this);
  connect(process, SIGNAL(finished(int)), this, SLOT(readFinished(int)));
  connect(process, SIGNAL(error(QProcess::ProcessError)), this, SLOT(processError(QProcess::ProcessError)));
  process->setProcessChannelMode(QProcess::SeparateChannels);
  process->start(script);
}

void Setting::write()
{
  qDebug() << "Writing setting";
  QProcess* process = new QProcess(this);
  connect(process, SIGNAL(finished(int)), this, SLOT(writeFinished(int)));
  connect(process, SIGNAL(error(QProcess::ProcessError)), this, SLOT(processError(QProcess::ProcessError)));
  process->start(script, values);
}

void Setting::readFinished(int code)
{
  qDebug() << "Read finished with code" << code;
  QProcess* process = (QProcess*) sender();
  if(code == 0)
  {
    QByteArray bytes = process->readAllStandardOutput();
    qDebug() << "Got value:" << bytes;
    QStringList newValues = QString::fromUtf8(bytes).split("\n");
    setValues(newValues);
    emit readSuccess();
  }
  else
  {
    emit readFailure();
  }
  process->deleteLater();
}

void Setting::writeFinished(int code)
{
  qDebug() << "Write finished with code" << code;
  if(code == 0)
  {
    emit writeSuccess();
  }
  else
  {
    emit writeFailure();
  }

  QProcess* process = (QProcess*) sender();
  process->deleteLater();
}

void Setting::processError(QProcess::ProcessError error)
{
  qDebug() << "Process error " << error;
  QProcess* process = (QProcess*) sender();
  process->deleteLater();
}


