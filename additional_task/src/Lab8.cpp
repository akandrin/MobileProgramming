#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>

#include "benchmark.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<Benchmark>("harbour.Lab8.Benchmark", 0, 1, "Benchmark");

    return SailfishApp::main(argc, argv);
}
