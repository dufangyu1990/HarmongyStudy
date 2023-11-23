import StudentListItem from '../view/StudentListItem';
import DataModel from '../viewModel/DataModel';

@Component
export default struct StudentListPage{
  private studentList:Array<string>=[];

  aboutToAppear(){
    this.studentList =  DataModel.getStudentList();
  }


  build(){
    Column({space:16}){
      Text($r('app.string.Student_List_Title'))
        .fontSize('28fp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .width('100%')
        .margin({
          top:'24vp',
          bottom:'12vp'
        })
        .textAlign(TextAlign.Center)

      ForEach(this.studentList,(item:string)=>{
        StudentListItem({ name : item })
      },(item:string)=>JSON.stringify(item))

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}