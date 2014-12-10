#include "timezonedatamodel.h"
#include <QFile>
#include <QDebug>

const QString TimeZoneDataModel::ZONE_INFO_TAB_FILE = "/usr/share/zoneinfo/zone1970.tab";
QList<TimeZoneDataModel::TimeZoneData> TimeZoneDataModel::_data;

TimeZoneDataModel::TimeZoneDataModel(QObject *parent) :
  QAbstractListModel(parent)
{
  if(_data.isEmpty()) {
    readData();
  }
}

QHash<int, QByteArray> TimeZoneDataModel::roleNames() const
{
  QHash<int, QByteArray> roles;
  roles[CodesRole] = "codes";
  roles[CoordinatesRole] = "coordinates";
  roles[AreaRole] = "area";
  roles[RegionRole] = "region";
  roles[CommentsRole] = "comments";
  return roles;
}

int TimeZoneDataModel::rowCount(const QModelIndex& parent) const
{
  Q_UNUSED(parent)
  return _data.size();
}

QVariant TimeZoneDataModel::data(const QModelIndex& index, int role) const
{
  TimeZoneData const& datum = _data.at(index.row());
  switch(role)
  {
    case CodesRole: return datum.codes;
    case CoordinatesRole: return datum.coordinates;
    case AreaRole: return datum.area;
    case RegionRole: return datum.region;
    case CommentsRole: return datum.comments;
    default: return QVariant();
  }
}

int TimeZoneDataModel::find(QString area, QString region)
{
  for(int i = 0; i < _data.size(); ++i) {
    TimeZoneData const& datum = _data.at(i);
    if(datum.area == area && datum.region == region) {
      return i;
    }
  }
  return -1;
}

void TimeZoneDataModel::readData()
{
  QFile file(ZONE_INFO_TAB_FILE);
  if(file.open(QFile::ReadOnly)) {
    while(!file.atEnd()) {
      QString line = QString::fromUtf8(file.readLine());
      if(line.isEmpty() || line.startsWith('#'))
        continue;

      QStringList parts = line.split(QChar::Tabulation);

      QStringList codes = parts.at(0).trimmed().split(',');
      QString coordinates = parts.at(1).trimmed();
      QString area = parts.at(2).section('/', 0, 0).trimmed();
      QString region = parts.at(2).section('/', 1, 1).trimmed();
      QString comments = parts.length() == 4 ? parts.at(3).trimmed() : "";


      TimeZoneData datum = {
        codes, coordinates, area, region, comments
      };

      _data.append(datum);
    }
  }

  qSort(_data.begin(), _data.end(), timeZoneDataLessThan);
}

bool TimeZoneDataModel::timeZoneDataLessThan(const TimeZoneDataModel::TimeZoneData& t1, const TimeZoneDataModel::TimeZoneData& t2)
{
  if(t1.area != t2.area) {
    return t1.area < t2.area;
  } else {
    return t1.region < t2.region;
  }
}
