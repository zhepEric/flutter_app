import 'package:flutter/material.dart';
import 'package:flutter_app/provider/CounterModel.dart';
import 'package:provider/provider.dart';

//import 'package:dio/dio.dart';
//import 'net/NetController.dart';
import 'page/SplashPage.dart';
import 'page/MyHomePage.dart';

//void main() => runApp(MyApp());

void main(){
  //Provider状态管理除了一些状态在顶层设置，其他状态建议在子页面初始化
// final counter =  CounterModel();
//
// final values = 10;

 runApp(
//   Provider<int>.value(value: values,
//   ChangeNotifierProvider.value不仅能够提供数据供子孙节点使用，还可以在数据改变的时候通知所有听众刷新。
//   child: ChangeNotifierProvider.value(value: counter,

     MyApp()
//   ),
//   )
 );
}

class MyApp extends StatelessWidget {
  int a = 0; //如果不加final 就会报警告，因为StatelessWidget本身是不可变的，所有里面的属性也应该是不可变的
  // This widget is the root of your application.


///Element实现了BuildContext
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //flutter 中存在静态路由和动态路由
      routes: {
        '/MyHomePage': (BuildContext context) => MyHomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashPage(),
    );
  }
}
