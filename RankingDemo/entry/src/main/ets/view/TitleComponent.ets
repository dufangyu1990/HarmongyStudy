import AppContext from '@ohos.app.ability.common';
import { FontSize, TitleBarStyle, WEIGHT } from '../common/constants/Constants';
@Component
export struct TitleComponent{
  // @Link装饰的变量可以和父组件的 @State 变量建立双向的数据绑定。
  // 即@Link修饰的变量必须使用其父组件提供的@State变量进行初始化，允许组件内部修改@Link变量值且更改会通知给父组件。
  @Link isRefreshData:boolean;
  @State title: Resource = $r('app.string.title_default');

  build(){
    Row(){
      Row(){
        Image($r('app.media.ic_public_back'))
          .height(TitleBarStyle.IMAGE_BACK_SIZE)
          .width(TitleBarStyle.IMAGE_BACK_SIZE)
          .margin({right:TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT})
          .onClick(()=>{
            let handler = getContext(this) as AppContext.UIAbilityContext;
            handler.terminateSelf();
          })
        Text(this.title).fontSize(FontSize.LARGE)
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.Start)

      Row(){
        Image($r('app.media.loading'))
          .height(TitleBarStyle.IMAGE_LOADING_SIZE)
          .width(TitleBarStyle.IMAGE_LOADING_SIZE)
          .onClick(() => {
            this.isRefreshData = !this.isRefreshData;
          })
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.End)

    }
    .width(WEIGHT)
    .padding({ left: TitleBarStyle.BAR_MARGIN_HORIZONTAL,
      right: TitleBarStyle.BAR_MARGIN_HORIZONTAL })
    .margin({ top: TitleBarStyle.BAR_MARGIN_TOP })
    .height(TitleBarStyle.BAR_HEIGHT)
    .justifyContent(FlexAlign.SpaceAround)



  }
}