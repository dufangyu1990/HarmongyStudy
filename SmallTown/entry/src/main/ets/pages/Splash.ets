
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { splashImages } from '../viewmodel/SplashModel';
import router from '@ohos.router';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Splash{
  private data:Resource[]= [];
  @State showSwiper:boolean = false;
  private timer:number=-1;
  @State countdown:number = Const.COUNTDOWN;
  private swiperController:SwiperController = new SwiperController();
  // 在此生命周期中根据当前时间段分配轮播图
  aboutToAppear():void{
    let hours = new Date().getHours();
    if(hours>=Const.MORNING_TIME && hours<Const.EVENING_TIME){
      this.data = splashImages.day;
    }else if(hours>=Const.EVENING_TIME && hours<=Const.NIGHT_TIME){
      this.data = splashImages.dusk;
    }else{
      this.data = splashImages.night;
    }
    // 启动画面展示3秒后 轮播展示溪村小镇风景
    setTimeout(()=>{
      this.showSwiper = true;
      this.startTiming();
    },Const.SPLASH_DURATION)
  }
  // 轮播展示溪村小镇风景倒计时5秒
  startTiming(){
  this.timer = setInterval(()=>{
    this.countdown--;
    if(this.countdown==0){
      this.clearTiming();
      this.jumpToMainPage();
    }
  },Const.DURATION);
  }
  clearTiming(){
    if(this.timer!=-1){
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  jumpToMainPage(){
    hilog.info(0x0000, 'testTag', '11111');
    this.clearTiming();
    router.replaceUrl({
      url:'pages/Index'
    })
  }

  aboutToDisappear(){
    this.clearTiming();
  }

  build(){
    Column(){
      Stack(){
        if(this.showSwiper){
          Swiper(this.swiperController){
          ForEach(this.data,(item:Resource)=>{
            Image(item).width(Const.FULL_SIZE).height(Const.FULL_SIZE).objectFit(ImageFit.Cover)
          })
          }
          .loop(true)
          .interval(2*Const.DURATION)
          .duration(Const.DURATION)
          .autoPlay(true)
          .indicatorStyle({
            bottom:$r('app.float.100'),
            color:$r('app.color.swiper_dot_color')
          })
          .curve(Curve.Linear)
          .onChange((index:number)=>{
            console.info(index.toString())
          })

          Text(){
            Span($r('app.string.skip'))
            Span(`${this.countdown}`)
          }
          .onClick(()=>{
            this.jumpToMainPage()
          })
          .fontColor(Color.White)
          .fontSize($r('app.float.12fp'))
          .backgroundColor($r('app.color.swiper_jump_bg_color'))
          .width($r('app.float.63'))
          .height($r('app.float.24'))
          .borderRadius($r('app.float.10'))
          .textAlign(TextAlign.Center)
          .position({
            x:Const.PERCENTAGE_78,
            y:$r('app.float.35')
          })

        }else{
          Image($r('app.media.splash_bg'))
            .width(Const.FULL_SIZE)
            .height(Const.FULL_SIZE)
          Image($r('app.media.ic_splash'))
            .width($r('app.float.192'))
            .height($r('app.float.192'))
            .offset({
              y:`-${Const.PERCENTAGE_15}`
            })
            .objectFit(ImageFit.Contain)
          Column(){
            Text(Const.SPLASH_DES)
              .fontColor(Color.White)
              .fontSize($r('app.float.font_size_24fp'))
              .fontWeight(FontWeight.Medium)

            Text(Const.SPLASH_WELCOME)
              .fontSize($r('app.float.font_size_16fp'))
              .fontColor(Color.White)
              .margin({
                top:$r('app.float.5')
              })

          }
          .offset({y:Const.PERCENTAGE_25})

        }
      }
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
  }
}