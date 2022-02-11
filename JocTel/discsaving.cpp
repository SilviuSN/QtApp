#include "discsaving.h"
#include <QDate>
#include <iostream>

DIscSaving::DIscSaving()
{}

void DIscSaving::writeScoreToDisc(int newScore)
{
    QFile scoreFile("Scores.txt");

    if(!scoreFile.open(QIODevice::WriteOnly| QIODevice::Append)){
        qDebug() << "File not open" << scoreFile.error();
    }else{
        QTextStream stream(&scoreFile);
        stream << QString::number(newScore) <<" on: "<< QDate::currentDate().toString("yyyy.MM.dd") << "\n";
        scoreFile.close();
    }
}

std::optional<std::vector<int>> DIscSaving::readFromDisc()
{
    std::vector<int> scoruri;
    QFile scoreFile("Scores.txt");
    if(!scoreFile.open(QIODevice::ReadOnly))
    {
        qDebug() << "error opening file: " << scoreFile.error();
        return std::nullopt;
    }
    QTextStream instream(&scoreFile);
    while (!instream.atEnd()){
        QString line = instream.readLine();
        auto result = line.split(" ");
        scoruri.push_back(result[0].toInt());
    }
    scoreFile.close();
    return scoruri;
}
