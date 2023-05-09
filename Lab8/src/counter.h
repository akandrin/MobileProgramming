#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ get WRITE set RESET reset NOTIFY valueChanged)

private:
    int value;
public:
    Q_INVOKABLE explicit Counter(QObject *parent = nullptr);

    Q_INVOKABLE int get() const;
    Q_INVOKABLE void set(int value);
    Q_INVOKABLE void reset();

    Q_INVOKABLE void increment();

signals:
    void valueChanged();
};

#endif // COUNTER_H
