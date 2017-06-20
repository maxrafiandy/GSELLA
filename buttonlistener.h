#ifndef BUTTONLISTENER_H
#define BUTTONLISTENER_H

#include <QObject>
#include "configlistener.h"

class ButtonListener : public QObject
{
    Q_OBJECT
public:
    explicit ButtonListener(QObject *parent = nullptr);

signals:

public slots:
    void slotKirim(const QString &jumlah, const QString &hp, const QString &pin, const int &pulsa);
    void slotSaveConfig(const QString &pulsa, const QString &kuota,const QString &stok, const QString &pin);
};

#endif // BUTTONLISTENER_H
