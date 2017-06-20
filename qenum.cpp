#include "qenum.h"
#include <QtQml>

void QEnum::registerToQml()
{
    qmlRegisterType<QEnum>("QEnum", 1, 0, "Enum");
}
