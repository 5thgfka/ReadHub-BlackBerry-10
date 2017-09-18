/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4

TabbedPane {
    Menu.definition: MenuDefinition {
        // Add a Help action
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject(_app)
                help.open();
            }
        }
    }
    id: tabroot
    property variant currentNav: activeTab.nav
    property bool showBackButton: true
    showTabsOnActionBar: false
    Tab { //First tab
        title: qsTr("热门话题")
        imageSource: "asset:///images/icon_hot.png"
        property alias nav: nav_hot
        NavigationPane {
            id: nav_hot
            backButtonsVisible: tabroot.showBackButton
            
            ListHotpageView {
                nav: nav_hot
            }
        }
    }//End of first tab
    
    Tab { //Second tab
        title: qsTr("科技动态") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icon_tech.png"
        property alias nav: nav_tech
        NavigationPane {
            id: nav_tech
            backButtonsVisible: tabroot.showBackButton
            
            ListTechpageView {
                nav: nav_tech
            }
        }
    } //End of second tab
    Tab { //Third tab
        title: qsTr("开发者资讯") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icon_technews.png"
        property alias nav: nav_technews
        NavigationPane {
            id: nav_technews
            backButtonsVisible: tabroot.showBackButton
            
            ListTechnewspageView {
                nav: nav_technews
            }
        }
    } //End of third tab
    
    onCreationCompleted: {
        
        _nao.topicNewsReturned.connect(getTopicNews);
        _nao.TechReturned.connect(getTech);
        _nao.TechNewsReturned.connect(getTechNews);
    }
    
    function getTopicNews(success, resp){
        if (success) {
            var itemObj = JSON.parse(resp);
            itemObj.data.map(function(x){
                var itemMap = {
                    "id": x.id,
                    "title": x.title,
                    "summary": x.summary,
                    "publishDate": x.publishDate,
                    "instantView": x.newsArray[0].url
                };
                theTopNewsItemsModel.insert(itemMap);
            })
        }
    }
    
    function getTech(success, resp){
        if (success) {
            var itemObj = JSON.parse(resp);
            itemObj.data.map(function(x){
                    var itemMap = {
                        "title": x.title,
                        "summary": x.summary,
                        "publishDate": x.publishDate,
                        "instantView": x.url
                    };
                    theTechItemsModel.insert(itemMap);
            })
        }
    }
    
    function getTechNews(success, resp){
        if (success) {
            var itemObj = JSON.parse(resp);
            itemObj.data.map(function(x){
                    var itemMap = {
                        "title": x.title,
                        "summary": x.summary,
                        "publishDate": x.publishDate,
                        "instantView": x.url
                    };
                    theTechNewsItemsModel.insert(itemMap);
            })
        }
    }
    attachedObjects: [
        
        ComponentDefinition {
            id: previewPage
            PreviewPage{
            
            }
        },
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
            
            }
        },
        GroupDataModel {
            id: theTopNewsItemsModel
            grouping: ItemGrouping.None
        },
        GroupDataModel {
            id: theTechItemsModel
            grouping: ItemGrouping.None
        },
        GroupDataModel {
            id: theTechNewsItemsModel
            grouping: ItemGrouping.None
        }
    ]
}
