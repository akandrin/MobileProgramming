#include "mystringlist.h"

MyStringList::MyStringList(QObject *parent) : QObject(parent)
{
}

QString MyStringList::getText() const
{
    /*QString result = stringList.join(",").toLower();
    result[0] = result[0].toUpper();*/
    return stringList.join("/");
}

void MyStringList::addString(QString string)
{
    stringList.push_back(string);
    emit textChanged();
    auto path = QString("/%1").arg(stringList.join("/"));
    system(QString("ls %1").arg(path).toLocal8Bit().data());
    system(QString("cat %1").arg(path).toLocal8Bit().data());
    system("echo");
}

void MyStringList::removeLastString()
{
    if (!stringList.empty())
    {
        stringList.pop_back();
        emit textChanged();
    }

    auto path = QString("/%1").arg(stringList.join("/"));
    system(QString("ls %1").arg(path).toLocal8Bit().data());
    system(QString("cat %1").arg(path).toLocal8Bit().data());
    system("echo");
}
