#include "buttonlistener.h"

#include <QDebug>
#ifdef Q_OS_ANDROID
#include <QtAndroid>
#endif
#include "qenum.h"
ButtonListener::ButtonListener(QObject *parent) : QObject(parent)
{

}

void ButtonListener::slotKirim(const QString &jumlah, const QString &hp, const QString &pin, const int &pulsa)
{
    QString format = ConfigListener::formatPulsa();
    if (pulsa == KUOTA)
    {
        format = format = ConfigListener::formatKuota();
    }

    format.replace("NOHP",hp);
    format.replace("NOMINAL",jumlah);
    format.replace("PIN",pin);

#ifdef Q_OS_ANDROID
    QAndroidJniObject arg = QAndroidJniObject::fromString(format);
    QtAndroid::androidActivity().callMethod<void>("makeCall", "(Ljava/lang/String;)V", arg.object<jstring>());
#endif
    qDebug() << format;
}

void ButtonListener::slotSaveConfig(const QString &pulsa, const QString &kuota, const QString &stok, const QString &pin)
{
    QSettings settings(app_config, QSettings::NativeFormat);
    settings.setValue("pulsa", pulsa);
    settings.setValue("kuota", kuota);
    settings.setValue("stok", stok);
    settings.setValue("pin", pin);
}

