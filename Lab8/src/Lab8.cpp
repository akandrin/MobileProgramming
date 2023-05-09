#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <cassert>

#include "counter.h"
#include "mystringlist.h"

int main(int argc, char *argv[])
{
    // 2. Использовать мета-объект класса-счётчика для создания объекта и вызова его методов
    // (использовать функцию main, результат изменения состояния проверять выводом на консоль).
    const QMetaObject* staticObject = &Counter::staticMetaObject;
    QObject* object = staticObject->newInstance();
    int value = -1;
    assert(QMetaObject::invokeMethod(object, "get", Q_RETURN_ARG(int, value)));
    qDebug() << "Init value = " << value;

    assert(QMetaObject::invokeMethod(object, "increment"));
    assert(QMetaObject::invokeMethod(object, "get", Q_RETURN_ARG(int, value)));
    qDebug() << "Value after increment = " << value;

    assert(QMetaObject::invokeMethod(object, "reset"));
    assert(QMetaObject::invokeMethod(object, "get", Q_RETURN_ARG(int, value)));
    qDebug() << "Value after reset = " << value;

    assert(QMetaObject::invokeMethod(object, "set", Q_ARG(int, 777)));
    assert(QMetaObject::invokeMethod(object, "get", Q_RETURN_ARG(int, value)));
    qDebug() << "Value after set = " << value;


    qmlRegisterType<Counter>("harbour.Lab8.Counter", 0, 1, "Counter");
    qmlRegisterType<MyStringList>("harbour.Lab8.MyStringList", 0, 1, "MyStringList");
    return SailfishApp::main(argc, argv);
}
