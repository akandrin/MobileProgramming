#include "counter.h"

Counter::Counter(QObject *parent) : QObject(parent)
{
}

int Counter::get() const
{
    return value;
}

void Counter::reset()
{
    value = 0;
    emit valueChanged();
}

void Counter::increment()
{
    ++value;
    emit valueChanged();
}
