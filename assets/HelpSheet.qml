import bb.cascades 1.4
Sheet {
    id: helpSheet
    content: Page {
        id: aboutPage
        titleBar: TitleBar {
            title: qsTr("ABOUT")
            dismissAction: ActionItem {
                title: qsTr("Close") + Retranslate.onLanguageChanged
                onTriggered: {
                    helpSheet.close()
                    if (helpSheet) helpSheet.destroy();
                }
            }
        }
        ScrollView {
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                leftPadding: 20.0
                rightPadding: 20.0
                Header {
                    title: qsTr("APP")
                }
                Label {
                    multiline: true
                    text: qsTr("This is a readhub.me app for BlackBerry 10, but I'm not related to readhub.me. Enjoy!")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.Medium
                    textStyle.fontWeight: FontWeight.W100
                    textStyle.textAlign: TextAlign.Center
                }
                Header {
                    title: qsTr("DEVELOPED BY")
                }
                Label {
                    multiline: true
                    text: qsTr("ekse ( 5thgfka@gmail.com )")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.Medium
                    textStyle.fontWeight: FontWeight.W100
                }
                Header {
                    title: qsTr("KNOWN BUGS")
                }
                Label {
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle.fontSize: FontSize.Small
                    text: qsTr("1.   Ad. preview error")
                    textStyle.fontWeight: FontWeight.W100
                }
                Label {
                    multiline: true
                    text: qsTr("ALL CONTENT RIGHTS RESERVED BY READHUB.ME")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.XXSmall
                    textStyle.fontWeight: FontWeight.W100
                }
            }
        }
    }
}


