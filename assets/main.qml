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
    showTabsOnActionBar: true
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("热门话题") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icon_hot.png"
        Page {
            titleBar: TitleBar {
                // Localized text with the dynamic translation and locale updates support
                title: qsTr("ReadHub - 热门话题") + Retranslate.onLocaleOrLanguageChanged
            }
            Container {
                layout: DockLayout {
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    leftPadding: ui.du(3.3)
                    topPadding: ui.du(3.3)
                    rightPadding: ui.du(3.3)
                    bottomPadding: ui.du(3.3)
                    //! [1]
                    // The list view with all events
                    ListView {
                        dataModel: theTopNewsItemsModel
                        
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                
                                Container {
                                    
                                    Label {
                                        text: ListItemData.title
                                        multiline: true
                                        textStyle.color: ui.palette.primary
                                    }
                                    Divider {
                                    }
                                    Label {
                                        text: ListItemData.summary
                                        multiline: true
                                        verticalAlignment: VerticalAlignment.Top
                                        horizontalAlignment: HorizontalAlignment.Fill
                                    }
                                    Label {
                                        text: ListItemData.publishDate
                                        horizontalAlignment: HorizontalAlignment.Right
                                        multiline: true
                                        bottomMargin: 10.0
                                    }
                                }
                            }
                        ]
                        onTriggered: {
                            var selected = theTopNewsItemsModel.data(indexPath);
                            var openurl = selected.instantView;
                            var prevPage = previewPage.createObject(_app);
                            prevPage.url = openurl;
                            
                            prevPage.open();
                        }
                    }
                }
            }
        }
    } //End of first tab
    Tab { //Second tab
        title: qsTr("科技动态") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icon_tech.png"
        Page {
            titleBar: TitleBar {
                // Localized text with the dynamic translation and locale updates support
                title: qsTr("ReadHub - 科技动态") + Retranslate.onLocaleOrLanguageChanged
            }
            Container {
                layout: DockLayout {
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    leftPadding: ui.du(3.3)
                    topPadding: ui.du(3.3)
                    rightPadding: ui.du(3.3)
                    bottomPadding: ui.du(3.3)
                    //! [1]
                    // The list view with all events
                    ListView {
                        dataModel: theTechItemsModel
                        
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                
                                Container {
                                    
                                    Label {
                                        text: ListItemData.title
                                        multiline: true
                                        textStyle.color: ui.palette.primary
                                    }
                                    Divider {
                                    }
                                    Label {
                                        text: ListItemData.summary
                                        multiline: true
                                        verticalAlignment: VerticalAlignment.Top
                                        horizontalAlignment: HorizontalAlignment.Fill
                                    }
                                    Label {
                                        text: ListItemData.publishDate
                                        horizontalAlignment: HorizontalAlignment.Right
                                        multiline: true
                                        bottomMargin: 10.0
                                    }
                                }
                            }
                        ]
                        onTriggered: {
                            var selected = theTechItemsModel.data(indexPath);
                            var openurl = selected.instantView;
                            var prevPage = previewPage.createObject(_app);
                            prevPage.url = openurl;
                            
                            prevPage.open();
                        }
                    }
                }
            }
        }
    } //End of second tab
    Tab { //Third tab
        title: qsTr("开发者资讯") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icon_technews.png"
        Page {
            titleBar: TitleBar {
                // Localized text with the dynamic translation and locale updates support
                title: qsTr("ReadHub - 开发者资讯") + Retranslate.onLocaleOrLanguageChanged
            }
            Container {
                layout: DockLayout {
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    leftPadding: ui.du(3.3)
                    topPadding: ui.du(3.3)
                    rightPadding: ui.du(3.3)
                    bottomPadding: ui.du(3.3)
                    //! [1]
                    // The list view with all events
                    ListView {
                        dataModel: theTechNewsItemsModel
                        
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                
                                Container {
                                    
                                    Label {
                                        text: ListItemData.title
                                        multiline: true
                                        textStyle.color: ui.palette.primary
                                    }
                                    Divider {
                                    }
                                    Label {
                                        text: ListItemData.summary
                                        multiline: true
                                        verticalAlignment: VerticalAlignment.Top
                                        horizontalAlignment: HorizontalAlignment.Fill
                                    }
                                    Label {
                                        text: ListItemData.publishDate
                                        horizontalAlignment: HorizontalAlignment.Right
                                        multiline: true
                                        bottomMargin: 10.0
                                    }
                                }
                            }
                        ]
                        onTriggered: {
                            var selected = theTechNewsItemsModel.data(indexPath);
                            var openurl = selected.instantView;
                            var prevPage = previewPage.createObject(_app);
                            prevPage.url = openurl;
                            
                            prevPage.open();
                        }
                    }
                }
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
