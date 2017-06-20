#ifndef CONFIGLISTENER_H
#define CONFIGLISTENER_H

#include <QObject>
#include <QStandardPaths>
#include <QSettings>

const QString storage_path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation);
#ifdef Q_OS_ANDROID
    const QString app_path = storage_path + "/Android/data/com.g.sella";
#else
    const QString app_path = storage_path + "/com.g.sella";
#endif
const QString app_config = app_path + "/config.ini";

class ConfigListener : public QObject
{
    Q_OBJECT
private:

public:
    explicit ConfigListener(QObject *parent = nullptr);
    static const QString formatPulsa();
    static const QString formatKuota();
    static const QString formatCekStok();
    static const QString pin();
signals:

public slots:
    QString slotGetFormatKuota();
    QString slotGetFormatPulsa();
    QString slotGetFormatCekStok();
    QString slotGetPIN();
};

#endif // CONFIGLISTENER_H
