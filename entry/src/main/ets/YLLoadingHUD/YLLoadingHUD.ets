export enum HUDMode{
  loading,
  string,
  success,
  error
}

export  class HUDClass {
  public show: boolean;
  public mode: HUDMode;
  public string: string;

  constructor(show: boolean,mode: HUDMode,string: string) {
    this.show = show;
    this.mode = mode;
    this.string = string;
  }
}

@Component
export default  struct YLLoadingHUD2{

  @Link @Watch('itemChange') hudItem:HUDClass

  itemChange(){
    console.log("itemchange")
    clearTimeout(this.timeoutID);
    this.clearAnimation()

    this.realShow = this.hudItem.show
    if(this.realShow){
      this.ZIndex = 999
    }else {
      this.ZIndex = -1
      this.clearAnimation()
    }

    if(this.hudItem.mode == HUDMode.loading){
      this.startRotate()
      this.image = '/YLLoadingHUD/loading.png'
    }else if(this.hudItem.mode == HUDMode.success){
      this.image = '/YLLoadingHUD/success.png'
      this.timerAction()
    }else if(this.hudItem.mode == HUDMode.error){
      this.image = '/YLLoadingHUD/error.png'
      this.timerAction()
    }


  }

  @State rotateAngle:number=0
  private rotateTimeOut: any //计时器
  private timeoutID:any

  @State image:string = '/YLLoadingHUD/loading.png'

  @State realShow:boolean = false


  @State ZIndex:number = -1

  aboutToAppear(){
    this.realShow = this.hudItem.show
    if(this.realShow && this.hudItem.mode == HUDMode.loading){
      this.startRotate()
    }
    if(this.hudItem.mode == HUDMode.loading){

      this.image = '/YLLoadingHUD/loading.png'
    }else if(this.hudItem.mode == HUDMode.success){

      this.image = '/YLLoadingHUD/success.png'
    }else if(this.hudItem.mode == HUDMode.error){

      this.image = '/YLLoadingHUD/error.png'
    } else if(this.hudItem.mode == HUDMode.string){

      if(this.hudItem.string.length == 0){
        this.hudItem.string = "loading"
      }

    }
  }





  timerAction(){
    clearTimeout(this.timeoutID);
    var that = this
    this.timeoutID = setTimeout(function() {
      that.realShow = false
      that.hudItem.show = false
      console.log('do after 1s delay.');
    }, 2000);
  }



  startRotate() {
    this.rotateTimeOut = setInterval(() => {
      this.rotateAngle += 10
    }, 30)
  }

  clearAnimation(){
    this.rotateAngle = 0
    clearInterval(this.rotateTimeOut)
  }

  build() {

    Stack(){
      Row(){
        Column() {
          if(this.hudItem.mode != HUDMode.string){
            Image(this.image)
              .objectFit(ImageFit.Contain)
              .height(40)
              .aspectRatio(1)
              .width(40)
              .margin({ bottom: 5 })
              .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
          }

          if (this.hudItem.string.length > 0){
            Text(this.hudItem.string)
              // .maxLines(1)
              .fontColor(Color.White)
              .fontSize(15)
              .margin({top:5})
          }
        }
        .constraintSize({maxWidth:300})
        .visibility(Visibility.Hidden)
        .padding({left:10,right:10,top:15,bottom:15})
      }
      .backgroundColor(Color.Black)
      .opacity(0.8)
      .borderRadius(8)


      Column() {
        if(this.hudItem.mode != HUDMode.string){
          Image(this.image)
            .objectFit(ImageFit.Contain)
            .height(40)
            .aspectRatio(1)
            .width(40)
            .margin({ bottom: 5 })
            .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
        }

        if (this.hudItem.string.length > 0){
          Text(this.hudItem.string)
            .fontColor(Color.White)
            .fontSize(15)
            .margin({top:5})
        }
      }
      .padding({left:10,right:10,top:15,bottom:15})
      .constraintSize({maxWidth:300})

    }
    .zIndex(this.ZIndex)
    .visibility(this.realShow?Visibility.Visible : Visibility.None)

  }

}