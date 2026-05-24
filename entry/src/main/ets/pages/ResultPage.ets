import router from '@ohos.router'
import { promptAction } from '@kit.ArkUI'

// ✅ 显式定义志愿者数据类型，解决数组类型报错
interface Student {
  id: string
  name: string
  major: string
  time: string
}

@Entry
@Component
struct ResultPage {
  // 模拟AI返回的志愿者数据（显式声明类型）
  @State students: Student[] = [
    { id: 'EDU22-LI', name: '李同学', major: '师范专业', time: '周一/三/五 下午' },
    { id: 'CS22-WANG', name: '王同学', major: '计算机专业', time: '周二/四 全天' }
  ]

  build() {
    Column({ space: 20 }) {
      Text('匹配成功！')
        .fontSize(34)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0066CC')
        .margin({ top: 40 })

      Text('以下志愿者可为您上门服务')
        .fontSize(22)

      // 志愿者卡片列表
      ForEach(this.students, (item: Student) => {
        this.StudentCard(item)
      })

      Text('感谢您信任高校学子，服务全程自愿、免费、保密')
        .fontSize(16)
        .fontColor('#999')
        .margin({ top: 30 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F7F8FA')
  }

  // ✅ 用@Builder装饰器封装自定义组件，解决报错
  @Builder
  StudentCard(item: Student) {
    Column({ space: 10 }) {
      Text(item.name)
        .fontSize(26)
        .fontWeight(FontWeight.Medium)
      Text(`专业：${item.major}`)
        .fontSize(20)
      Text(`可服务时间：${item.time}`)
        .fontSize(20)

      Button('预约这位同学')
        .width('80%')
        .height(50)
        .backgroundColor('#0066CC')
        .fontSize(22)
        .margin({ top: 10 })
        .onClick(() => {
          // 替换alert为鸿蒙原生弹窗
          promptAction.showToast({
            message: '预约成功！即将生成服务单',
            duration: 2000
          })
        })
    }
    .width('100%')
    .padding(25)
    .backgroundColor('#fff')
    .borderRadius(20)
    .shadow({ radius: 5 })
  }
}