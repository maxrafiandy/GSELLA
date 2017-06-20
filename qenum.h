#ifndef QENUM_H
#define QENUM_H

#include <QObject>

enum
{
    REGULER,
    KUOTA
};

class QEnum : public QObject
{
    Q_OBJECT
public:
    enum PULSA
    {
        REGULER,
        KUOTA
    };
    Q_ENUMS(PULSA)

    // Do not forget to declare your class to the QML system.
    static void registerToQml();

signals:

public slots:
};

#endif // QENUM_H
