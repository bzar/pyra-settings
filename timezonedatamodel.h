#include <QAbstractListModel>


class TimeZoneDataModel : public QAbstractListModel
{
  Q_OBJECT

public:
  enum TimeZoneDataRoles {
    CodesRole = Qt::UserRole + 1,
    CoordinatesRole,
    AreaRole,
    RegionRole,
    CommentsRole
  };

  explicit TimeZoneDataModel(QObject *parent = 0);

  QHash<int, QByteArray> roleNames() const;
  int rowCount(const QModelIndex &parent = QModelIndex()) const;
  QVariant data(const QModelIndex &index, int role) const;

  Q_INVOKABLE int find(QString area, QString region);

private:
  struct TimeZoneData {
    QStringList codes;
    QString coordinates; // ISO 6709
    QString area;
    QString region;
    QString comments;
  };

  static void readData();
  static bool timeZoneDataLessThan(const TimeZoneData& t1, const TimeZoneData &t2);

  static const QString ZONE_INFO_TAB_FILE;
  static QList<TimeZoneData> _data;
};
