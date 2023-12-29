import { CommonConstants as Const} from '../common/constants/CommonConstants';
import { AddressItem, Location } from '../viewmodel/AddressItem';
import { PositionItem } from '../viewmodel/PositionItem';
@Component
export struct Map {
  private panOption:PanGestureOptions = new PanGestureOptions({direction:PanDirection.All})
  @State screenMapWidth:number = 0;
  @State screenMapHeight:number= 0;
  @State mapWidth:number=0;
  @State mapHeight:number=0;
  @State mapX:number=0;
  @State mapY:number= 0;
  @Provide data:AddressItem = new AddressItem();

  build() {
    Stack({ alignContent: Alignment.End }) {
      Column() {
        Stack({alignContent:Alignment.TopStart}){
          ForEach(this.data.locations,(item:Location)=>{
            Image(this.data.icon).width(Const.MAP_LANDMARKS_SIZE).height(Const.MAP_LANDMARKS_SIZE).offset({x:item.positionX,y:item.positionY})
            Text(this.data.name).fontSize($r('app.float.map_text_size')).fontColor(this.data.textColor).fontWeight(FontWeight.Bold).offset({x:item.positionX+Const.MAP_TEXT_OFFSET_X,y:item.positionY+Const.MAP_TEXT_OFFSET_Y})
          },(item: Location) => JSON.stringify(item))
        }
        .backgroundImage($r('app.media.ic_nav_map'))
        .backgroundImageSize(ImageSize.Cover)
        .width(this.mapWidth)
        .height(this.mapHeight)
        .offset({x:this.mapX,y:this.mapY})
      }
      .height(Const.FULL_PERCENT)
      .width(Const.FULL_PERCENT)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .onAreaChange((oldVal:Area,newVal:Area)=>{
        if(this.screenMapWidth===0||this.screenMapHeight===0){
          this.screenMapWidth = Number(newVal.width);
          this.screenMapHeight = Number(newVal.height);
          this.mapHeight = this.screenMapHeight;
          this.mapWidth = Const.MAP_WIDTH * this.mapHeight / Const.MAP_HEIGHT;
          this.mapX = (this.screenMapWidth-this.mapWidth)/Const.DOUBLE_OR_HALF;
          MapController.initLeftTop(this.screenMapWidth,this.mapWidth);
        }
      })
      .gesture(

      )

      CustomPanel({
        mapWidth:$mapWidth,
        mapHeight:$mapHeight,
        screenMapWidth:$screenMapWidth,
        screenMapHeight:$screenMapHeight,
        mapX:$mapX,
        mapY:$mapY,
      })

    }
  }


  zoomOutCheck():void{
    if(this.mapX>0){
      this.mapX = 0;
    }
    if(this.mapY>0){
      this.mapY = 0;
    }
    if((this.mapX+this.mapWidth)<this.screenMapWidth){
      this.mapX = this.screenMapWidth-this.mapWidth;
    }

    if((this.mapY+this.mapHeight)<(this.mapHeight/MapController.mapMultiples())){
      this.mapY = this.mapHeight / MapController.mapMultiples() - this.mapHeight;
    }
  }
}

@Component
struct PositionGridView{
   positionItem:PositionItem = new PositionItem();
  build(){
    Column(){
      Image(this.positionItem.icon)
        .width($r('app.float.navigation_panel_icon_size'))
        .height($r('app.float.navigation_panel_icon_size'))
        .margin($r('app.float.navigation_panel_icon_margin'))
      Text(this.positionItem.text).fontSize($r('app.float.navigation_icon_text'))
    }
  }
}

@Component
struct CustomPanel{
  build(){

  }
}