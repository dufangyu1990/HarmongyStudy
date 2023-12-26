import router from '@ohos.router';
import CommonConstant from '../common/constant/CommonConstant';
import { DataItemBean } from '../viewModel/DataItemBean';

@Component
export default struct StudentListItem{
  // 是否选中当前Item
  @State isChecked:boolean = false;
  // 从父组件单向同步状态：@Prop
  @Prop isListMode:boolean;
  private index: number=0;
  // 1、ArkUI提供了@Link装饰器，用于与父组件双向同步状态。当子组件StudentListItem中的clickIndex用@Link修饰，可与父组件StudentListPage中的clickIndex建立双向同步关系。
  // 2、ArkUI中监听状态变化@Watch的能力。用@Watch修饰的状态，当状态发生变化时，会触发声明时定义的回调。
  @Link @Watch('onClickIndexChanged') clickIndex:number;

  // 当clickIndex状态变化时，将触发onClickIndexChanged回调：如果点击的列表项索引不等于当前列表项索引，则将isExpanded状态置为false，从而收起该目标项。
  onClickIndexChanged(){
    if(this.clickIndex!= this.index){
      this.isChecked = false;
    }else{
      this.isChecked = true;
    }
  }
  // 列表Item子项Image点击事件
  onItemChildImageClick: () => void


  private studentData:DataItemBean=new DataItemBean("","");


  aboutToAppear() {
    console.log("DataItemBean",this.studentData.title)
    // console.log("DataItemBean", this.studentData.image)
  }


  @Builder checkIcon(icon:Resource, width?: Length, height?: Length){
    Image(icon).objectFit(ImageFit.Contain)
      .width(width!=null?width:$r('app.float.checkbox_width'))
      .height(height!=null?height:$r('app.float.checkbox_width'))

  }

  build(){
    if(this.isListMode){
      Column(){
        Row(){
          Text(this.studentData.title)
            .fontColor(this.isChecked?Color.Red:Color.Black)
            .fontSize(this.isChecked?$r('app.float.item_checked_font_size'):$r('app.float.item_font_size'))
            .fontWeight(500)
            .opacity(this.isChecked?0.5:1.0)
            .decoration({type:this.isChecked?TextDecorationType.LineThrough:TextDecorationType.None})

          Blank()
          Image($r('app.media.ic_arrow_next'))
            .width('30vp')
            .height('30vp')
            .margin('30vp')
            .onClick(()=>{

              console.log('Next Click' + this.studentData.title);
              console.log('Next Click' + this.studentData.image);
              router.pushUrl({
                url:CommonConstant.STUDENT_DETAIL_URL,
                params:{
                  //自定义参数
                  studentData:this.studentData

                }
              }).catch(()=>{
                console.log('Next Click', 'IndexPage push error');
              })
            })


        }
        .width('100%')
        .height($r('app.float.list_item_height'))
        if(this.isChecked){
          Row(){
            Text().fontSize('18fp').fontColor(Color.Blue)

            Blank()

            Image(this.studentData.image)
              .objectFit(ImageFit.Cover)
              .width('50vp')
              .height('50vp')
              .borderRadius(100)
              .border({width:3})
              .borderStyle(BorderStyle.Dotted)
              .onClick(this.onItemChildImageClick)
          }
          .width('100%')
          .padding({left:10,right :10})
          .justifyContent(FlexAlign.SpaceAround)
        }
      }
      .borderRadius(22)
      .backgroundColor($r('app.color.start_window_background'))
      .width('100%')
      .height(this.isChecked?$r('app.float.list_item_expand_height'):$r('app.float.list_item_height'))
      .animation({duration:300})
      .onClick(()=>{
        animateTo({duration:300},()=>{
          this.isChecked = !this.isChecked;
        })

        this.clickIndex = this.index;
      })
    }else{
      Column(){
        Row(){
          Blank()
          Image($r('app.media.ic_arrow_next'))
            .width('15vp')
            .height('15vp')
            .margin(10)
            .onClick(()=>{
              console.log('Next Click' + this.studentData.title);
              console.log('Next Click' + this.studentData.image);

              router.pushUrl({
                url:CommonConstant.STUDENT_DETAIL_URL,
                params:{
                  studentData:this.studentData
                }
              }).catch(()=>{console.log('Next Click', ' push error')})
            })
        }
        .width('100%')
        Blank()
        Row(){
          Row() {
            if (this.isChecked) {
              this.checkIcon($r('app.media.ic_checked'), '16vp', '16vp')
            } else {
              this.checkIcon($r('app.media.ic_unchecked'), '16vp', '16vp')
            }
          }
          .onClick(() => {
            this.isChecked = !this.isChecked;
          })
          .margin(5)

          Blank()

          Row() {
            Text(this.studentData.title)
              .fontColor(this.isChecked ? Color.Yellow : Color.White)
              .fontSize('12vp')
              .fontWeight(500)
              .opacity(this.isChecked ? 0.5 : 1.0)
              .decoration({ type: this.isChecked ? TextDecorationType.LineThrough : TextDecorationType.None })
          }
          .backgroundColor($r('app.color.transparent_backgroundColor'))
          .borderRadius({ topLeft: 8, bottomRight: 10 })
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
        }
        .alignItems(VerticalAlign.Bottom)
        .width('100%')

      }
      .borderRadius(10)
      .width('100%')
      // 指定当前组件的长宽比
      .aspectRatio(1)
      .backgroundImage(this.studentData.image)
      .backgroundImageSize(ImageSize.Cover)
      .onClick(this.onItemChildImageClick)

    }

  }

}