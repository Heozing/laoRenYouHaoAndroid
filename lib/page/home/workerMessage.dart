import 'package:flutter/material.dart';

class WorkerMessagepage extends StatelessWidget {
  const WorkerMessagepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          //表格
          child: Table(
            //所有列宽
            columnWidths: const {
              //列宽
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(200.0),
              2: FixedColumnWidth(50.0),
            },
            //表格边框样式
            border: TableBorder.all(
              color: Colors.grey,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            children: [
              TableRow(
                  //第一行样式 添加背景色
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: [
                    //增加行高
                    SizedBox(
                      height: 40.0,
                      child: Text(
                        '姓名',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        // style: TextStyle(
                        //     color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      '头像',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '年龄',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '性别',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ]),
              TableRow(children: [
                Text('于沛尧'),
                //Text('男'),
                SizedBox(
                  width: 88.0,
                  height: 88.0,
                  child: Image.asset('assets/yuPeiYao.jpg'),
                ),
                Text('20'),
                Text('男'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
