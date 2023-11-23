@Component
export default struct StudentListItem{
  @State isChecked:boolean = false;
  private name?:string;

  @Builder checkIcon(icon:Resource){
    Image(icon).objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_width'))

  }

  build(){
    Row(){
      if(this.isChecked){
        this.checkIcon($r('app.media.ic_checked'))
      }else{
        this.checkIcon($r('app.media.ic_unchecked'))
      }
      Text(this.name)
        .fontColor(this.isChecked?Color.Red:Color.Black)
        .fontSize(this.isChecked?$r('app.float.item_checked_font_size'):$r('app.float.item_font_size'))
        .fontWeight(500)
        .opacity(this.isChecked?0.5:1.0)
        .decoration({type:this.isChecked?TextDecorationType.LineThrough:TextDecorationType.None})
    }
    .borderRadius(22)
    .backgroundColor($r('app.color.start_window_background'))
    .width('100%')
    .height($r('app.float.list_item_height'))
    .onClick(()=>{
      this.isChecked = !this.isChecked;
    })
  }

}