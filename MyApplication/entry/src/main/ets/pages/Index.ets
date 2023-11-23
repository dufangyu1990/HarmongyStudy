import StudentListPage from './StudentListPage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Column()  {
       StudentListPage();
    }
    .height('100%')
    .width('100%')
    .padding('10vp')
    .backgroundColor($r('app.color.page_background'))
  }
}



