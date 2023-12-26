import { DataItemBean } from './DataItemBean';

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

  getStudentList2():Array<DataItemBean>{
    let studentList:DataItemBean[]=[
      new DataItemBean("张三","https://c-ssl.duitang.com/uploads/item/201805/06/20180506084619_2svWA.jpeg"),
      new DataItemBean("李四","https://c-ssl.duitang.com/uploads/blog/202107/05/20210705215458_36c2b.jpg"),
      new DataItemBean("王五","https://c-ssl.duitang.com/uploads/blog/202112/17/20211217211133_85430.jpeg"),
      new DataItemBean("赵六","https://tse1-mm.cn.bing.net/th/id/OIP-C.2z8V15bPD1jmtWkBM47b_AHaHa?pid=ImgDet&rs=1"),
      new DataItemBean("KK","hhttps://tse1-mm.cn.bing.net/th/id/OIP-C.vzhdsIrhKA_hJ3mqJMKcVQHaIC?pid=ImgDet&rs=1"),
      new DataItemBean("Lucy","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202002%2F23%2F20200223151740_uudbp.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1701569400&t=d22c85d97eb299f8b081b0d5f88ea3f5"),
      new DataItemBean("JIM","https://c-ssl.duitang.com/uploads/item/201805/06/20180506084619_2svWA.jpeg"),
      new DataItemBean("Polly","https://c-ssl.duitang.com/uploads/item/201805/06/20180506084619_2svWA.jpeg"),
      new DataItemBean("阿杜","https://c-ssl.duitang.com/uploads/blog/202107/05/20210705215458_36c2b.jpg"),
      new DataItemBean("周传雄","https://c-ssl.duitang.com/uploads/blog/202112/17/20211217211133_85430.jpeg"),
      new DataItemBean("哈哈哈","https://tse1-mm.cn.bing.net/th/id/OIP-C.2z8V15bPD1jmtWkBM47b_AHaHa?pid=ImgDet&rs=1"),
      new DataItemBean("嘎嘎嘎","https://c-ssl.duitang.com/uploads/avatar/202202/07/20220207015125_23365.jpg"),
      new DataItemBean("哼哼哼","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202002%2F23%2F20200223151740_uudbp.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1701569400&t=d22c85d97eb299f8b081b0d5f88ea3f5"),
      new DataItemBean("呵呵呵","https://tse1-mm.cn.bing.net/th/id/OIP-C.vzhdsIrhKA_hJ3mqJMKcVQHaIC?pid=ImgDet&rs=1"),
    ];
    return studentList;
  }

}
export default new DataModel();