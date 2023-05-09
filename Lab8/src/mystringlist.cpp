#include "mystringlist.h"

MyStringList::MyStringList(QObject *parent) : QObject(parent)
{
}

QString MyStringList::getText() const
{
    QString result = stringList.join(",").toLower();
    result[0] = result[0].toUpper();
    return result;
}

void MyStringList::addString(QString string)
{
    stringList.push_back(string);
    emit textChanged();
}

void MyStringList::removeLastString()
{
    if (!stringList.empty())
    {
        stringList.pop_back();
        emit textChanged();
    }
}
