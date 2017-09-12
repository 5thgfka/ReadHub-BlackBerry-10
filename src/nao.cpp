/*
 * nao.cpp
 *
 *  Created on: 2016.1.3
 *      Author: ekse
 */

#include "nao.h"
#include <bb/data/JsonDataAccess>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QWaitCondition>
#include <bb/data/SqlDataAccess>
#include <bb/data/DataAccessError>
#include <QtSql/QtSql>

using namespace bb::data;
using namespace bb::cascades;

const QString readhub_topic = "https://api.readhub.me/topic";
const QString readhub_news = "https://api.readhub.me/news";
const QString readhub_technews = "https://api.readhub.me/technews";

Nao::Nao(QObject* parent) :
        QObject(parent), m_model(new GroupDataModel(this)), m_keyItemList(new GroupDataModel(this))
{
    mAccessManager = new QNetworkAccessManager(this);
}

//热门
void Nao::getTopicNews()
{
//    qDebug() << "getTopicNews";
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
// topic url
    QString path = readhub_topic;
    reply = mAccessManager->get(QNetworkRequest(QUrl(path)));
    bool connectResult = connect(reply, SIGNAL(finished()), this, SLOT(onTopicNewsGetReply()));
    connect(reply, SIGNAL(error(QNetworkReply::NetworkError)), this,
            SLOT(onErrorOcurred(QNetworkReply::NetworkError)));
    Q_ASSERT(connectResult);
}

void Nao::onTopicNewsGetReply()
{
//    qDebug() << "onTopicNewsGetReply";
    QNetworkReply* mReply = qobject_cast<QNetworkReply*>(sender());
    QByteArray buffer(mReply->readAll());
//    qDebug() << QString::fromUtf8(buffer);
    emit topicNewsReturned(true, QString::fromUtf8(buffer));
    disconnect(mReply);
    mReply->deleteLater();
}

void Nao::onErrorOcurred(QNetworkReply::NetworkError error)
{
//    qDebug() << error;
    emit topicNewsReturned(false, QString(error));
}

//科技
void Nao::getTech()
{
//    qDebug() << "getTech";
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
// topic url
    QString path = readhub_news;
    reply = mAccessManager->get(QNetworkRequest(QUrl(path)));
    bool connectResult = connect(reply, SIGNAL(finished()), this, SLOT(onTechGetReply()));
    connect(reply, SIGNAL(error(QNetworkReply::NetworkError)), this,
            SLOT(onTechErrorOcurred(QNetworkReply::NetworkError)));
    Q_ASSERT(connectResult);
}

void Nao::onTechGetReply()
{
//    qDebug() << "onTechGetReply";
    QNetworkReply* mReply = qobject_cast<QNetworkReply*>(sender());
    QByteArray buffer(mReply->readAll());
//    qDebug() << QString::fromUtf8(buffer);
    emit TechReturned(true, QString::fromUtf8(buffer));
    disconnect(mReply);
    mReply->deleteLater();
}

void Nao::onTechErrorOcurred(QNetworkReply::NetworkError error)
{
//    qDebug() << error;
    emit TechReturned(false, QString(error));
}


//科技
void Nao::getTechNews()
{
//    qDebug() << "getTechNews";
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
// topic url
    QString path = readhub_technews;
    reply = mAccessManager->get(QNetworkRequest(QUrl(path)));
    bool connectResult = connect(reply, SIGNAL(finished()), this, SLOT(onTechNewsGetReply()));
    connect(reply, SIGNAL(error(QNetworkReply::NetworkError)), this,
            SLOT(onTechNewsErrorOcurred(QNetworkReply::NetworkError)));
    Q_ASSERT(connectResult);
}

void Nao::onTechNewsGetReply()
{
//    qDebug() << "onTechNewsGetReply";
    QNetworkReply* mReply = qobject_cast<QNetworkReply*>(sender());
    QByteArray buffer(mReply->readAll());
//    qDebug() << QString::fromUtf8(buffer);
    emit TechNewsReturned(true, QString::fromUtf8(buffer));
    disconnect(mReply);
    mReply->deleteLater();
}

void Nao::onTechNewsErrorOcurred(QNetworkReply::NetworkError error)
{
//    qDebug() << error;
    emit TechNewsReturned(false, QString(error));
}


void Nao::onGetReply()
{
//    qDebug() << "onGetReply";
    QNetworkReply* mReply = qobject_cast<QNetworkReply*>(sender());
    QByteArray buffer(mReply->readAll());
//    qDebug() << QString::fromUtf8(buffer);
    emit starReturned(true, QString::fromUtf8(buffer));
    disconnect(mReply);
    mReply->deleteLater();
}

bb::cascades::GroupDataModel* Nao::model() const
{
    return m_model;
}

bb::cascades::GroupDataModel* Nao::keyItemList() const
{
    return m_keyItemList;
}

