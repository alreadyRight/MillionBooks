@Component
export struct AccountMainPage {

  @State createBooksIsOpen: boolean = false;
  @State isSelectingDate: boolean = false;
  // 账本数据源
  @State billBooksList: Object[] = []

  constructor() {
    super();
    // 测试账本数据
    let billBooksTestList = [
      {
        'icon': $r('app.media.bill_book_icon'),
        'bookName': '日常账本',
        'color': '#00F5FF'
      },
      {
        'icon': $r('app.media.bill_book_icon'),
        'bookName': '家庭账本',
        'color': '#F5F5DC'
      },
      {
        'icon': $r('app.media.bill_book_icon'),
        'bookName': '理财账本',
        'color': '#8B4513'
      },
      {
        'icon': $r('app.media.bill_book_icon'),
        'bookName': '金融账本',
        'color': '#D2691E'
      },
      {
        'icon': $r('app.media.bill_book_icon'),
        'bookName': '添加账本',
        'color': '#B22222'
      },
    ]
    // 初始化账本信息
    this.billBooksList = billBooksTestList;
    // 获取当前年月日
    // 获取当月,当前选择的账本的分类,金额
  }

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
    List({space: 12, initialIndex: 0}) {
      ForEach(this.billBooksList, (item: Record<string, Object>) => {
        ListItem() {
          Row({ space: 2 }) {
            Image(item.icon as Resource)
              .fillColor(item.color as string)
              .width(24).height(24).margin({ left: 5 })
            Text(item.bookName as string).fontSize(15)
          }.width(200).height(50).padding(5)
        }.onClick(() => {
          console.log('点击了其中一行')
        })
      })
    }.width(200).height(this.billBooksList.length * (50 + 5))
  }

}