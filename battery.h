#ifndef BATTERY_H
#define BATTERY_H
#include <QObject>

class Battery : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString source READ getSource WRITE setSource NOTIFY sourceChanged)
  Q_PROPERTY(qreal chargePercentage READ getChargePercentage NOTIFY chargePercentageChanged)

public:
  explicit Battery(QObject *parent = 0);
  QString getSource() const;
  void setSource(const QString& newSource);

  qreal getChargePercentage() const;


signals:
  void sourceChanged(QString);
  void chargePercentageChanged(qreal);

public slots:

private:
  void setChargePercentage(const qreal& value);

  QString source;
  qreal chargePercentage;
};

#endif // BATTERY_H
