import YLHud, { HUDClass, HUDMode } from '../YLLoadingHUD/YLLoadingHUD'

@Entry
@Component
struct Index {

  @State message: string = 'YLLoadingHUD'

  @State hudItem:HUDClass = {
    show:false,
    mode:HUDMode.loading,
    string:'loading'
  }

  build() {
    Stack(){
      Row() {
        Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.End,alignItems:ItemAlign.Center}) {
          Text(this.message)
            .fontSize(40)
            .fontWeight(FontWeight.Bold)


          Button("loading")
            .margin({top:100})
            .onClick(()=>{
              this.hudItem.mode = HUDMode.loading
              this.hudItem.string = "loading"
              this.hudItem.show = true
            })
          Button("string")
            .margin({top:20})
            .onClick(()=>{
              this.hudItem.mode = HUDMode.string
              this.hudItem.string = "This is a tip"
              this.hudItem.show = true

            })

          Button("success")
            .margin({top:20})
            .onClick(()=>{
              this.hudItem.mode = HUDMode.success
              this.hudItem.string = "success"
              this.hudItem.show = true
            })
          Button("error")
            .margin({top:20})
            .onClick(()=>{
              this.hudItem.mode = HUDMode.error
              this.hudItem.string = "error"
              this.hudItem.show = true

            })
          Button("dismiss")
            .margin({top:20})
            .onClick(()=>{
              this.hudItem.show = false

            })

        }
        .width('100%')
      }
      .height('100%')

      YLHud({hudItem:$hudItem})

    }

  }
}



