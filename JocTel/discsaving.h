#ifndef DISCSAVING_H
#define DISCSAVING_H
#include <QObject>
#include <QFile>
#include <QTextStream>

class DIscSaving: public QObject
{
    Q_OBJECT
public:
    DIscSaving();

    void writeScoreToDisc(int newScore);
    std::optional<std::vector<int>> readFromDisc();
};

#endif // DISCSAVING_H
