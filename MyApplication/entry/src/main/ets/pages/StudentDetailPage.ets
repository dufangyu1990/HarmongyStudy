import router from '@ohos.router';
const TAG = '[StudentDetailPage]';
@Entry
@Component
struct StudentDetailPage{
  // 接收参数，UI跟着参数变化，所以用state修饰
  @State name:string=(router.getParams() as Record<string,string>)['name']

  backMsg:string=this.name+"好帅";
  aboutToAppear(){
    console.log(TAG, 'StudentDetailPage接收的参数是: ' + this.name);
  }
  build(){

    Column({space:20}){
      Text(this.name)
        .fontColor(Color.Blue)
        .fontSize('24fp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .width('100%')
        .margin({
          top: '24vp',
          bottom: '12vp',
        })
        .textAlign(TextAlign.Center)


      Text(this.name.repeat(10))
        .margin({
          top:'30vp',
          bottom:'30vp'
        })
      Blank()
      Button("返回")
        .fontSize('16fp')
        .width('300vp')
        .height('40vp')
        .backgroundColor($r('app.color.page_background2'))
        .onClick(()=>{
          //返回上一页
          //router.back()
          // 返回到指定页面
          // router.back({ url: 'pages/StudentListPage' });

          router.back({
            url: 'pages/StudentListPage',
            params:{
              backMsg:this.backMsg
            }
          })
        })
    }
      .width('100%')
      .height('100%')
    .padding('16vp')
    .backgroundColor($r('app.color.page_background'))

  }

}