#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <cassert>

#include "benchmark.h"
#include "mystringlist.h"

int main(int argc, char *argv[])
{
    // 2. Использовать мета-объект класса-счётчика для создания объекта и вызова его методов
    // (использовать функцию main, результат изменения состояния проверять выводом на консоль).

    qmlRegisterType<Benchmark>("harbour.Lab8.Benchmark", 0, 1, "Benchmark");
    qmlRegisterType<MyStringList>("harbour.Lab8.MyStringList", 0, 1, "MyStringList");

    return SailfishApp::main(argc, argv);
}
