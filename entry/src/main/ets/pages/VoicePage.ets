import router from '@ohos.router'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct VoicePage {
  @State time: number = 3
  @State isRecording: boolean = false
  @State tip: string = '点击按钮，开始说话'
  private countTimer: number | null = null
  build() {
    Column({ space: 25 }) {
      Text('请说出您的需求')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 60 })

      Text(this.tip)
        .fontSize(22)
        .fontColor('#555')

      // 录音按钮（3秒自动结束）
      Stack({ alignContent: Alignment.Center }) {
        Circle()
          .width(180)
          .height(180)
          .fill(this.isRecording ? '#FF4444' : '#0066CC')

        if (this.isRecording) {
          Text(this.time.toString())
            .fontSize(60)
            .fontColor('#fff')
            .fontWeight(FontWeight.Bold)
        } else {
          Text('说话')
            .fontSize(32)
            .fontColor('#fff')
        }
      }
      .margin({ top: 50 })
      .onClick(() => this.startRecord())

      Text('我们会3秒内识别您的需求')
        .fontSize(20)
        .fontColor('#888')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#fff')
  }

  // 开始录音（3秒自动停止+上传AI）
  startRecord() {
    if (this.countTimer) {
      clearInterval(this.countTimer)
    }
    this.time = 3
    this.isRecording = true
    this.tip = '正在聆听...'

    // 3秒倒计时
    this.countTimer = setInterval(() => {
      this.time--
      if (this.time <= 0) {
        clearInterval(this.countTimer)
        this.isRecording = false
        this.tip = '正在为您匹配志愿者...'
        // 上传音频到AI边缘盒
        this.uploadToAI()
      }
    }, 1000)
  }

  // 对接AI接口
  uploadToAI() {
    // 模拟AI返回结果，真实环境替换为接口请求
    setTimeout(() => {
      router.pushUrl({ url: 'pages/ResultPage' })
    }, 1500)
  }
}