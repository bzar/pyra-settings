#ifndef SETTING_H
#define SETTING_H

#include <QQuickItem>
#include <QProcess>

class Setting : public QQuickItem
{
  Q_OBJECT
  Q_DISABLE_COPY(Setting)

  Q_PROPERTY(QString script READ getScript WRITE setScript NOTIFY scriptChanged)
  Q_PROPERTY(QStringList values READ getValues WRITE setValues NOTIFY valuesChanged)
  Q_PROPERTY(QString value READ getValue WRITE setValue NOTIFY valueChanged)

public:
  Setting(QQuickItem *parent = 0);
  QString getScript() const;
  void setScript(const QString& newScript);

  QStringList getValues() const;
  void setValues(const QStringList& newValue);
  QString getValue() const;
  void setValue(const QString& newValue);

signals:
  void scriptChanged(QString);
  void valuesChanged(QStringList);
  void valueChanged(QString);
  void writeSuccess();
  void writeFailure();
  void readSuccess();
  void readFailure();

public slots:
  void read();
  void write();

private slots:
  void readFinished(int);
  void writeFinished(int);
  void processError(QProcess::ProcessError);

private:
  QString script;
  QStringList values;
};

#endif // SETTING_H
