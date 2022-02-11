#ifndef SCOREMODEL_H
#define SCOREMODEL_H
#include <QObject>
#include <QQmlListProperty>
#include <QtConcurrent/QtConcurrent>
#include <QFuture>
#include "discsaving.h"

class ScoreModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList scoreList READ scoreList WRITE setScoreList NOTIFY scoreListChanged)
public:
    explicit ScoreModel(QObject *parent = 0);
     QStringList scoreList() const;
     void setScoreList(QStringList scoreVector);

signals:
    void scoreListChanged();

public slots:
    void insertNewScore(int newScore);

private:
    void updateScore();

    QStringList scoreList_;
    DIscSaving saves;

};

#endif // SCOREMODEL_H
