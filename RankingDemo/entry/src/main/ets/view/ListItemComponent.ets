
import { FontSize, ItemStyle, WEIGHT,FontWeight } from '../common/constants/Constants';

@Component
export struct ListItemComponent{
  index?:number;
  private name?:Resource;
  //@Prop装饰的变量可以和父组件的@State变量建立单向的数据绑定。
  // 即@Prop修饰的变量必须使用其父组件提供的@State变量进行初始化，允许组件内部修改@Prop变量值但更改不会通知给父组件。
  @Prop vote:string='';
  @Prop isSwitchDataSource: boolean = false;
  @State isChange:boolean =false;
  build(){

    Row(){
      Column(){
        if(this.isRenderCircleText()){
          if(this.index!==undefined){
            this.CircleText(this.index)
          }
        }else{
          Text(this.index?.toString())
            .lineHeight(ItemStyle.TEXT_LAYOUT_SIZE)
            .textAlign(TextAlign.Center)
            .width(ItemStyle.TEXT_LAYOUT_SIZE)
            .fontWeight(FontWeight.BOLD)
            .fontSize(FontSize.SMALL)
        }
      }
      .width(ItemStyle.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Text(this.name)
        .width(ItemStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(FontWeight.BOLDER)
        .fontSize(FontSize.MIDDLE)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
      Text(this.vote)
        .width(ItemStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)

    }
    .height(ItemStyle.BAR_HEIGHT)
    .width(WEIGHT)
    .onClick(()=>{
      this.isSwitchDataSource = !this.isSwitchDataSource;
      this.isChange = !this.isChange;
    })

  }


  @Builder CircleText(index:number){
    Row() {
      Text(this.index?.toString())
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(Color.White);
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(ItemStyle.CIRCLE_TEXT_BORDER_RADIUS)
    .size({ width: ItemStyle.CIRCLE_TEXT_SIZE,
      height: ItemStyle.CIRCLE_TEXT_SIZE })
    .backgroundColor($r('app.color.circle_text_background'))
  }

  isRenderCircleText():boolean{
    return this.index===1 || this.index ===2 || this.index===3;
  }

}