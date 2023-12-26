import StudentListItem from '../view/StudentListItem';
import DataModel from '../viewModel/DataModel';
import router from '@ohos.router';
import { DataItemBean } from '../viewModel/DataItemBean';
import CommonConstant from '../common/constant/CommonConstant';
import Prompt from '@system.prompt';

const TAG = '[StudentListPage]';
@Entry
@Component
export default struct StudentListPage{

  // swiper控制器
  private swiperController:SwiperController = new SwiperController();


  private studentList2:Array<DataItemBean>=[];
  @State backMsg:string='';

  // 是否是List组件模式
  @State isListMode:boolean = true;

  // 点击当前item的索引
  @State clickIndex:number=0;

  @State confirmMessage: string = ""
  // 当前list/gtid点击item
  @State currentClickItemData:DataItemBean = new DataItemBean("","");
  aboutToAppear(){
    this.studentList2 = DataModel.getStudentList2();
  }

  // 调用router.back()方法，不会新建页面，返回的是原来的页面，在原来页面中@State声明的变量不会重复声明，
  // 以及也不会触发页面的aboutToAppear()生命周期回调，因此无法直接在变量声明以及页面的aboutToAppear()
  // 生命周期回调中接收和解析router.back()传递过来的自定义参数，需要在onPageShow回调中处理
  onPageShow(){
    this.backMsg = (router.getParams() as Record<string,string>)['backMsg'];
    console.log(TAG, 'StudentDetailPage返回数据：StudentListPage => ' + this.backMsg)

    if(this.backMsg!=undefined && this.backMsg!=''){
      this.showToast(this.backMsg)
    }

  }

  showToast(message:string){
    Prompt.showToast({
      message:message
    })

  }

  @Builder NavigationMenus(){
    Row(){
      Toggle({type:ToggleType.Switch,isOn:this.isListMode})
        .selectedColor(Color.Red)
        .switchPointColor(Color.White)
        .onChange((isOn:boolean)=>{
          this.isListMode = isOn
        })
    }
  }

  @Builder SwiperBuilder(studentList:Array<DataItemBean>){
    Swiper(this.swiperController){
      ForEach(studentList,(item:DataItemBean)=>{
        Image(item.image)
          .borderRadius($r('app.float.home_swiper_borderRadius'))
          .width('100%')
          .height('240vp')
          .objectFit(ImageFit.Fill)
          .onClick(()=>{
            router.pushUrl({
              url:CommonConstant.STUDENT_DETAIL_URL,
              params:{
                studentData:item
              }
            }).catch(()=>{
              console.log('Next Click', 'IndexPage push error')
            })
          })
      },(item:DataItemBean)=>JSON.stringify(item))
    }
    .autoPlay(true)
    .indicatorStyle({mask:true,bottom:'10vp'})
    .margin({bottom:'10vp'})
  }


  build(){

    Navigation(){
      Row(){
        if(this.isListMode){
          Scroll(){
            Column(){
              // Swiper组件
              this.SwiperBuilder(this.studentList2)
              // 列表
              // List组件子组件ListItem之间默认是没有分割线的，部分场景子组件ListItem间需要设置分割线，
              // 这时候可以使用List组件的divider属性。divider属性包含四个参数：
              // 1、strokeWidth: 分割线的线宽。
              // 2、color: 分割线的颜色。
              // 3、startMargin：分割线距离列表侧边起始端的距离。
              // 4、endMargin: 分割线距离列表侧边结束端的距离
              List({space:16}){
                ForEach(this.studentList2,(item:DataItemBean,index:number)=>{
                  ListItem(){
                    // StudentListItem({
                    //   studentData: item,
                    //   isListMode:this.isListMode
                    // })
                    StudentListItem({
                      studentData: item,
                      index:index,
                      isListMode:this.isListMode,
                      clickIndex:$clickIndex,// 带有“@Link”装饰的属性必须初始化为“$”
                      onItemChildImageClick:()=>{
                        this.currentClickItemData = item

                      }
                    })

                  }
                },(item:string)=>JSON.stringify(item))
              }
              .divider({
                strokeWidth:1,
                color:Color.Gray,
                startMargin:30,
                endMargin:0
              })
              Text('---没有更多了---').fontSize('22vp').margin('30vp')
            }
          }
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
        }
        else{
          Scroll(){
            Column(){
              this.SwiperBuilder(this.studentList2)
              Grid(){
               ForEach(this.studentList2, (item: DataItemBean,index:number) => {
                  GridItem() {
                    // StudentListItem({
                    //   studentData: item ,
                    //   isListMode:this.isListMode
                    // })

                    StudentListItem({
                      studentData: item,
                      isListMode: this.isListMode,
                      clickIndex: $clickIndex, // 带有“@Link”装饰的属性必须初始化为“$”
                      onItemChildImageClick:()=>{
                        this.currentClickItemData = item
                      }
                    })




                  }
                }, (item: string,index:number) => JSON.stringify(item)+index)
              }
              .columnsTemplate('1fr 1fr 1fr ')
              .rowsTemplate('1fr 1fr 1fr 1fr')
              .columnsGap('10vp')
              .rowsGap('10vp')
              .height('640vp')

              Text('---没有更多了---').fontSize('22vp').margin('30vp')
            }
          }.scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
        }
      }.width('90%')
    }
    .title("学生名单")
    .size({ width: '100%', height: '100%' })
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .menus(this.NavigationMenus())
    .backgroundColor($r('app.color.page_background'))

  }
}