#ifndef MYSTRINGLIST_H
#define MYSTRINGLIST_H

#include <QObject>

// 5. Создать класс, содержащий список из строк.
// Класс должен содержать методы для добавления строки в список и удаления последней добавленной строки
class MyStringList : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ getText NOTIFY textChanged)

private:
    QStringList stringList;

public:
    explicit MyStringList(QObject *parent = nullptr);

    Q_INVOKABLE QString getText() const;

    Q_INVOKABLE void addString(QString string);
    Q_INVOKABLE void removeLastString();


signals:
    void textChanged();
};

#endif // MYSTRINGLIST_H
