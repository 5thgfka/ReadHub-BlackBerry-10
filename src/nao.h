/*
 * nao.h
 *
 *  Created on: 2016.1.3
 *      Author: ekse
 */

#ifndef NAO_H_
#define NAO_H_


#include <QtCore/QObject>
#include <bb/data/JsonDataAccess>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/QListDataModel>

#include <QtNetwork/QNetworkReply>

class Nao: public QObject
{
    Q_OBJECT
    // The model that provides the filtered list of contacts
    Q_PROPERTY(bb::cascades::GroupDataModel *model READ model CONSTANT);
    Q_PROPERTY(bb::cascades::GroupDataModel *keyItemList READ keyItemList CONSTANT);
public:
    Nao(QObject* parent=0);
    void getTopicNews();
    void getTech();
    void getTechNews();

    Q_SIGNAL void topicNewsReturned(bool success, QString resp);
    Q_SIGNAL void TechReturned(bool success, QString resp);
    Q_SIGNAL void TechNewsReturned(bool success, QString resp);

    Q_SIGNAL void starReturned(bool success, QString resp);

public Q_SLOTS:

private slots:
    /**
     * This Slot function is called when the network request to the
     * "weather service" is complete.
     */
    void onGetReply();
    void onTopicNewsGetReply();
    void onErrorOcurred(QNetworkReply::NetworkError error);

    void onTechGetReply();
    void onTechErrorOcurred(QNetworkReply::NetworkError error);

    void onTechNewsGetReply();
    void onTechNewsErrorOcurred(QNetworkReply::NetworkError error);

private:
    QString m_t;
    QString mJsonData;
    QString mShData;
    QString mSzData;
    QString mCyData;

    QNetworkAccessManager *mAccessManager;
    // The accessor methods of the properties
    bb::cascades::GroupDataModel* model() const;
    bb::cascades::GroupDataModel* keyItemList() const;
    // The property values
    bb::cascades::GroupDataModel* m_model;
    bb::cascades::GroupDataModel* m_keyItemList;
};


#endif /* NAO_H_ */
