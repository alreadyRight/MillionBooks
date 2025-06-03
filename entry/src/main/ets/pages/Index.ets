import { AccountBookPage } from './account_book_page';
import { AccountMainPage } from './account_main_page';
import { AccountDetailPage } from './account_detail_page';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabItems: string[] = ['主页', '账户', '明细']

  build() {
    Column() {
      Column() {
        this.ContentCurrentPage()
      }.height('90%')

      Row({ space: 20 }) {
        ForEach(this.tabItems, (item: string, index: number) => {
          Column() {
            Image(this.getTabIconResource(index))
              .width(20)
              .height(20)
              .margin({ top: 5 })
              .objectFit(ImageFit.Contain)
              .fillColor(this.currentIndex === index ? Color.Blue : Color.Black)
            Text(item).fontSize(12).margin({ top: 3 })
              .fontColor(this.currentIndex === index ? Color.Blue : Color.Black)
          }
          .onClick(() => {
            this.currentIndex = index
            console.log(`切换到Tab: ${this.tabItems[index]}, 当前index: ${this.currentIndex}`);
          })
          .opacity(0.6)
          .width('30%')
          .justifyContent(FlexAlign.Center)
        })
      }.height('10%')
    }
  }

  private getTabIconResource(index: number): Resource {
    const icons = [
      $r('app.media.bill_accounting_icon'),
      $r('app.media.bill_book_icon'),
      $r("app.media.bill_detail_icon"),
    ]
    return icons[index];
  }

  @Builder
  private ContentCurrentPage() {
    if (this.currentIndex === 0) {
      AccountMainPage()
    } else if (this.currentIndex === 1) {
      AccountBookPage()
    } else if (this.currentIndex === 2) {
      AccountDetailPage()
    }
  }

  @Builder
  TabBuilder(text: string, index: number, icon: Resource) {
    Column() {
      Image(icon).width(24).height(24).objectFit(ImageFit.Contain)
      Text(text).fontSize(14)
    }
  }
}