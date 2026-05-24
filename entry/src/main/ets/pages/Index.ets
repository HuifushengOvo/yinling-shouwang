import router from '@ohos.router'

@Entry
@Component
struct Index {
  build() {
    Column({ space: 30 }) {
      Text('银龄守望\n老年数字生活互助站')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ top: 40 })

      Grid() {
        // 微信使用
        GridItem() {
          this.ServiceCard('微信使用', '#07C160')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/VoicePage' })
        })

        // 医院挂号
        GridItem() {
          this.ServiceCard('医院挂号', '#0066CC')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/VoicePage' })
        })

        // 医保社保
        GridItem() {
          this.ServiceCard('医保社保', '#FF6633')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/VoicePage' })
        })

        // 打车导航
        GridItem() {
          this.ServiceCard('打车导航', '#9933FF')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/VoicePage' })
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(20)
      .rowsGap(20)
      .padding(25)
      .width('100%')

      Text('您想学什么？点击即可开始')
        .fontSize(22)
        .fontColor('#666')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F7F8FA')
  }

  @Builder
  ServiceCard(name: string, color: ResourceColor) {
    Text(name)
      .fontSize(24)
      .fontColor('#fff')
      .width('100%')
      .height(140)
      .backgroundColor(color)
      .borderRadius(20)
      .textAlign(TextAlign.Center)
  }
}