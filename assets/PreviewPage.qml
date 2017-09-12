import bb.cascades 1.4

Sheet {
    id: previewPage
    property alias url: webpage.url

    content: Page {
        titleBar: TitleBar {
            dismissAction: ActionItem {
                title: qsTr("Close") + Retranslate.onLanguageChanged
                onTriggered: {
                    previewPage.close()
                    if (previewPage) previewPage.destroy();
                }
            }
        }
        ScrollView {
            id: scrollView
            scrollViewProperties {
                scrollMode: ScrollMode.Both
                pinchToZoomEnabled: true
            }
            Container {
                WebView {
                    id: webpage
                }
            }
        }
    }
}
