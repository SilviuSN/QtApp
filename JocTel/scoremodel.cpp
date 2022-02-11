#include "scoremodel.h"
#include <algorithm>

ScoreModel::ScoreModel(QObject *parent)
{
    updateScore();
}

void ScoreModel::updateScore(){
    std::vector<QString> temporaryScore;

    scoreList_.clear();
    if(auto result = saves.readFromDisc()){
        for(auto element: *result){
            temporaryScore.push_back(QString::number(element));
        }
    }
    std::copy(temporaryScore.begin(), temporaryScore.end(), std::back_inserter(scoreList_));
}

QStringList ScoreModel::scoreList() const
{
    return scoreList_;
}

void ScoreModel::setScoreList(QStringList scoreVector)
{
    scoreList_ = scoreVector;
}

void ScoreModel::insertNewScore(int newScore){
    QFuture<void> result = QtConcurrent::run([=](){
        saves.writeScoreToDisc(newScore);
    });
    result.waitForFinished();
    updateScore();
    emit scoreListChanged();
}

