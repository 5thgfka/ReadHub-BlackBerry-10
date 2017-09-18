import bb.cascades 1.4
import bb.multimedia 1.4
import bb.system 1.2

Page {
    id: hotpage
    property string nid: ""
    property string topicid_endpoint: "https://api.readhub.me/topic/%1"
    property NavigationPane hnav
    ScrollView {
        scrollViewProperties {
            scrollMode: ScrollMode.Vertical
        }
        Container {
            layout: StackLayout {

            }
            leftPadding: ui.du(3.3)
            topPadding: ui.du(3.3)
            rightPadding: ui.du(3.3)
            bottomPadding: ui.du(3.3)

            Label {
                id: title
                text: ""
                multiline: true
                textStyle.fontSize: FontSize.XLarge
                textStyle.color: ui.palette.primary
            }
            Divider {
            }
            Label {
                id: summary
                text: ""
                multiline: true
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Fill
                opacity: 0.8
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                
                leftPadding: ui.du(3.3)
                topPadding: ui.du(3.3)
                rightPadding: ui.du(3.3)
                bottomPadding: ui.du(3.3)
                
                //! [1]
                // The list view with entityRelatedTopics
                id: relatedNewsCtn
            }
            Label {
                id: eventTracker
                text: ""
                multiline: true
                textStyle.color: ui.palette.primary
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Fill

                leftPadding: ui.du(3.3)
                topPadding: ui.du(3.3)
                rightPadding: ui.du(3.3)
                bottomPadding: ui.du(3.3)
                //! [1]
                // The list view with timeline
                id: timelineCtn
            }
        }
        attachedObjects: [
            Common {
                id: co
            },
            ComponentDefinition{
                id: relatedNew
                Container {
                    property variant rnTitle
                    property variant rnSiteName
                    property variant rnMobileUrl
                    
                    topPadding: ui.du(1.3)
                    bottomPadding: ui.du(1.3)
                    
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    
                    Label {
                        text: rnTitle
                        multiline: true
                    }
                    Label {
                        text: rnSiteName
                        textStyle.color: Color.Gray
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                    Divider {
                    }
                    gestureHandlers: TapHandler {
                        onTapped: {
                            var prevPage = previewPage.createObject(_app);
                            prevPage.url = rnMobileUrl;
                            prevPage.open();
                        }
                    }
                }
            },
            ComponentDefinition{
                id: timelineNew
                Container {
                    property variant newsDate
                    property variant newsTitle
                    
                    topPadding: ui.du(1.3)
                    bottomPadding: ui.du(1.3)
                    
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    
                    Label {
                        text: newsDate
                        minWidth: ui.du(20)
                    }
                    Label {
                        text: newsTitle
                        multiline: true
                    }
                }
            }
        ]
    }
    
    function setTopicId(topicId) {
        var endp = topicid_endpoint.arg(topicId)
        co.ajax("get", endp, [], function(b, d) {
                if (b) {
                    try {
                        var jsonObj = JSON.parse(d);
                        title.text = jsonObj.title;
                        summary.text = jsonObj.summary;
                        // timeline
                        var tls = jsonObj.timeline;
                        var topics = tls.topics;
                        for (var i = 0; i < topics.length; i ++) {
                            var topic = topics[i];
                            var topicTitle = topic['title'];
                            var topicCreatedAt = topic['createdAt'];
                            var tlitem = timelineNew.createObject();
                            timelineCtn.add(tlitem);
                            tlitem.newsTitle = topicTitle
                            tlitem.newsDate = topicCreatedAt.split("T")[0]
                        }
                        //newsArray
                        var newsArray = jsonObj.newsArray;
                        for(var i = 0; i < newsArray.length; i++){
                            var news = newsArray[i];
                            var newsTitle = news['title'];
                            var newsSiteName = news['siteName'];
                            var newsMobileUrl = news['mobileUrl'];
                            
                            var rlitem = relatedNew.createObject();
                            relatedNewsCtn.add(rlitem);
                            rlitem.rnTitle = newsTitle
                            rlitem.rnSiteName = newsSiteName
                            rlitem.rnMobileUrl = newsMobileUrl
                        }
                        eventTracker.text = "事件追踪";
                    } catch (e) {
                    
                    }
                }
        }, [], false);
    }
}