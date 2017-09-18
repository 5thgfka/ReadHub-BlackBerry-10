import bb.cascades 1.4

Page {
    property variant nav
    titleBar: TitleBar {
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Readhub - 科技动态") + Retranslate.onLocaleOrLanguageChanged
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