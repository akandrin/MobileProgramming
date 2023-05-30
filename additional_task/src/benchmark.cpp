#include "benchmark.h"
#include <fstream>
#include <cassert>

Benchmark::Benchmark(QObject *parent) : QObject(parent)
{
    timer.setInterval(1000);

    connect(&timer, &QTimer::timeout, this, &Benchmark::updateCPUImpl);
    connect(&timer, &QTimer::timeout, this, &Benchmark::updatePowerImpl);
    connect(&timer, &QTimer::timeout, this, &Benchmark::updateRAMImpl);

    previousProcStatInfo = readProcStatInfo();
    timer.start();
}

Benchmark::~Benchmark()
{
    timer.stop();
    disconnect(&timer, &QTimer::timeout, this, &Benchmark::updateCPUImpl);
    disconnect(&timer, &QTimer::timeout, this, &Benchmark::updatePowerImpl);
    disconnect(&timer, &QTimer::timeout, this, &Benchmark::updateRAMImpl);
}

void Benchmark::updateCPUImpl()
{
    ProcStatInfo procStatInfo = readProcStatInfo();
    ProcStatInfo deltaProcStatInfo{
        procStatInfo.user    - previousProcStatInfo.user,
        procStatInfo.nice    - previousProcStatInfo.nice,
        procStatInfo.system  - previousProcStatInfo.system,
        procStatInfo.idle     - previousProcStatInfo.idle,
        procStatInfo.iowait  - previousProcStatInfo.iowait,
        procStatInfo.irq     - previousProcStatInfo.irq,
        procStatInfo.softirq - previousProcStatInfo.softirq
    };

    size_t totalWithoutIdle = deltaProcStatInfo.user + deltaProcStatInfo.nice + deltaProcStatInfo.system;
    size_t total = totalWithoutIdle + deltaProcStatInfo.idle;
    emit updateCPU(100.0f * totalWithoutIdle / total);

    previousProcStatInfo = procStatInfo;
}

void Benchmark::updatePowerImpl()
{
    PowerInfo powerInfo = readPowerInfo();
    emit updatePower(powerInfo.capacity);
}

void Benchmark::updateRAMImpl()
{
    RamInfo ramInfo = readRamInfo();
    emit updateRAM(ramInfo.total, ramInfo.free, ramInfo.measureUnit);
}

Benchmark::ProcStatInfo Benchmark::readProcStatInfo() const
{
    std::ifstream procStat("/proc/stat");
    assert(procStat.is_open());

    ProcStatInfo result;
    std::string dummy;
    procStat >> dummy;
    procStat >> result.user;
    procStat >> result.nice;
    procStat >> result.system;
    procStat >> result.idle;
    procStat >> result.iowait;
    procStat >> result.irq;
    procStat >> result.softirq;

    return result;
}

Benchmark::RamInfo Benchmark::readRamInfo() const
{
    std::ifstream memInfo("/proc/meminfo");
    assert(memInfo.is_open());

    RamInfo result;
    std::string dummy;
    std::string measureUnit;
    memInfo >> dummy;
    memInfo >> result.total;
    memInfo >> measureUnit;
    memInfo >> dummy;
    memInfo >> result.free;

    result.measureUnit = QString(measureUnit.data());

    return result;
}

Benchmark::PowerInfo Benchmark::readPowerInfo() const
{
    std::ifstream powerInfo("/sys/class/power_supply/BAT0/capacity");
    assert(powerInfo.is_open());

    PowerInfo result;
    powerInfo >> result.capacity;

    return result;
}
