@Component
export struct AccountMainPage {

  @State createBooksIsOpen: boolean = false;
  @State isSelectingDate: boolean = false;

  build() {
    Column() {
      Column() {
        this.navigationBar()
      }.height('15%')
      Column() {
        Text('主页')
      }.height('85%')
    }
    .width('100%').height('100%').justifyContent(FlexAlign.Center)
  }

  /*自定义导航栏*/
  @Builder
  private navigationBar() {
    Row() {
      Row({space: 3}) {
        // 按钮, 切换账本
        Text('添加账本')
          .fontSize(14).fontColor(Color.Black)
        Image(this.createBooksIsOpen ? $r('app.media.bill_arrow_up') : $r('app.media.bill_arrow_down'))
          .width(18).height(18)
      }
      .margin({left: 20, top: 5})
      .onClick(() => {
        this.createBooksIsOpen = !this.createBooksIsOpen
      })
      .layoutWeight(1)
      .bindPopup(this.createBooksIsOpen, {
        builder: this.billBooksSelectPopBuilder,
        placement: Placement.Bottom,
        onStateChange: (e) => {
          if (!e.isVisible) {
            this.createBooksIsOpen = false;
          }
        }
      })
      // 按钮, 切换日期
      Row({space: 6}) {
        Text('当月')
          .fontSize(18).fontColor(Color.Black)
        Image(this.isSelectingDate ? $r('app.media.bill_arrow_up') : $r('app.media.bill_arrow_down'))
          .width(18).height(18)
      }
      .margin({top: 5})
      .padding(5)
      .onClick(() => {
        this.isSelectingDate = !this.isSelectingDate
      })
      .layoutWeight(2)
      .justifyContent(FlexAlign.Center)
      .bindPopup(this.isSelectingDate, {
        builder: this.dateSelectPopBuilder,
        placement: Placement.Bottom,
        onStateChange: (e) => {
          if (!e.isVisible) {
            this.isSelectingDate = false;
          }
        }
      })
      // 右侧预留空白
      Blank().layoutWeight(1).margin({right: 10})
    }
  }

  /*自定义日期选择气泡*/
  @Builder
  private dateSelectPopBuilder() {

  }

  /*自定义账本气泡*/
  @Builder
  private billBooksSelectPopBuilder() {

  }

}