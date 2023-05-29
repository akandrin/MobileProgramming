#ifndef BENCHMARK_H
#define BENCHMARK_H

#include <QObject>
#include <QTimer>

class Benchmark : public QObject
{
    Q_OBJECT
private:
    QTimer timer;

public:
    explicit Benchmark(QObject *parent = nullptr);
    ~Benchmark();

signals:
    void updateCPU(float percent);
    void updatePower(float capacity);
    void updateRAM(float total, float free, QString measureUnit);

protected slots:
    void updateCPUImpl();
    void updatePowerImpl();
    void updateRAMImpl();

private:
    struct ProcStatInfo
    {
        size_t user = 0;
        size_t nice = 0;
        size_t system = 0;
        size_t idle = 0;
        size_t iowait = 0;
        size_t irq = 0;
        size_t softirq = 0;
        ProcStatInfo() = default;
        ProcStatInfo(size_t user, size_t nice, size_t system, size_t idle, size_t iowait, size_t irq, size_t softirq)
            : user(user), nice(nice), system(system), idle(idle), iowait(iowait), irq(irq), softirq(softirq){}
    } previousProcStatInfo;

    ProcStatInfo readProcStatInfo() const;

    struct RamInfo
    {
        size_t total = 0;
        size_t free = 0;
        QString measureUnit;
    };

    RamInfo readRamInfo() const;

    struct PowerInfo
    {
        size_t capacity = 0;
    };

    PowerInfo readPowerInfo() const;
};

#endif // BENCHMARK_H
