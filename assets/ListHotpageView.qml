import bb.cascades 1.4

Page {
    property variant nav
    titleBar: TitleBar {
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Readhub - 热门话题") + Retranslate.onLocaleOrLanguageChanged
    }
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    actionBarVisibility: ChromeVisibility.Compact
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
                    var nid = selected.id;
                    var hotTrackPageView = Qt.createComponent("HotTrackPageView.qml").createObject(nav);
                    hotTrackPageView.nid = nid;
                    hotTrackPageView.setTopicId(nid);
                    nav.push(hotTrackPageView);
                }
                attachedObjects: [
                    ListScrollStateHandler{
                        onScrollingChanged: {
                            if(scrolling && atEnd){
                                // load more.
                            }
                        }
                    }
                ]
            }
        }
    }
}
