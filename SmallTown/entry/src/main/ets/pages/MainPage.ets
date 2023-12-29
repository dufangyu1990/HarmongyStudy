
import { CommonConstants as Const} from '../common/constants/CommonConstants';
import { BottomTabsList } from '../viewmodel/BottomTabsModel';

@Entry
@Component
struct MainPage{
  // 当底部标签栏index改变时调用onIndexChange()方法，改变Tabs组件的index
  @State @Watch('onIndexChange')bottomTabIndex:number = 1;
  private controller:TabsController = new TabsController();

  @Builder TabBuilder(index:number,_name:string){
    Column(){
      Image(this.bottomTabIndex===index?BottomTabsList[index].iconSelected:BottomTabsList[index].icon)
        .width(Const.ICON_SIZE)
        .height(Const.ICON_SIZE)
        .objectFit(ImageFit.Contain)

        Text(BottomTabsList[index].text)
          .fontSize($r('app.float.bottom_font_size'))
          .opacity(Const.OPACITY)
          .fontColor(this.bottomTabIndex===index?$r('app.color.bottom_tabs_font_color_selected'):$r('app.color.bottom_tabs_font_color'))
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .border({width:{ top: Const.BORDER_WIDTH },color:$r('app.color.color_border') })
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }
  onIndexChange(){
    this.controller.changeIndex(this.bottomTabIndex);
  }

  build(){
    Flex({direction:FlexDirection.Column,alignItems:ItemAlign.End,justifyContent:FlexAlign.End}){
      Tabs({barPosition:BarPosition.End,index:1,controller:this.controller}){
        TabContent(){
          Map()
        }.tabBar(this.TabBuilder(0,'Map'))

        TabContent(){
          Zones()
        }.tabBar(this.TabBuilder(1,'Zone'))


        TabContent(){
          Trains()
        }.tabBar(this.TabBuilder(2,'Train'))

      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(Const.BAR_HEIGHT)
      .onChange((index:number)=>{
        this.bottomTabIndex = index;
      })
    }
    .width(Const.FULL_PERCENT)
  }
}