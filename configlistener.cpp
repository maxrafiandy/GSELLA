#include "configlistener.h"
#include <QDebug>

ConfigListener::ConfigListener(QObject *parent) : QObject(parent)
{

}

const QString ConfigListener::formatPulsa()
{
    QSettings settings(app_config, QSettings::NativeFormat);
    return settings.value("pulsa", "").toString();
}

const QString ConfigListener::formatKuota()
{
    QSettings settings(app_config, QSettings::NativeFormat);
    return settings.value("kuota", "").toString();
}

const QString ConfigListener::formatCekStok()
{
    QSettings settings(app_config, QSettings::NativeFormat);
    return settings.value("stok", "").toString();
}

const QString ConfigListener::pin()
{
    QSettings settings(app_config, QSettings::NativeFormat);
    return settings.value("pin", "").toString();
}

QString ConfigListener::slotGetFormatKuota()
{
    return ConfigListener::formatKuota();
}

QString ConfigListener::slotGetFormatPulsa()
{
    return ConfigListener::formatPulsa();
}

QString ConfigListener::slotGetFormatCekStok()
{
    return ConfigListener::formatCekStok();
}

QString ConfigListener::slotGetPIN()
{
    return ConfigListener::pin();
}
