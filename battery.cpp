#include "battery.h"

Battery::Battery(QObject *parent) : QObject(parent), source(), chargePercentage(50.0)
{

}

qreal Battery::getChargePercentage() const
{
  return chargePercentage;
}

void Battery::setChargePercentage(const qreal& value)
{
  if(qAbs(value - chargePercentage) > 0.001)
  {
    chargePercentage = value;
    emit chargePercentageChanged(chargePercentage);
  }
}

QString Battery::getSource() const
{
  return source;
}

void Battery::setSource(const QString& newSource)
{
  if(source != newSource)
  {
    source = newSource;
    emit sourceChanged(source);
  }
}
