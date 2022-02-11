#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>
#include "scoremodel.h"
int main(int argc, char *argv[])
{
    ScoreModel scoreModel;

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/JocTel/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);



    auto rootContext = engine.rootContext();
    rootContext->setContextProperty("ScoreModel",&scoreModel);

    engine.load(url);
    return app.exec();
}
