export class DataModel{

  private studentList:Array<string>=[
    "张三",
    "李四",
    "王五",
    "赵六",
    "刘德华",
    "张学友",
    "张海枝",
  ];

  getStudentList():Array<string>{
    return this.studentList;
  }
}
export default new DataModel();