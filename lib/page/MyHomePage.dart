import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../net/NetController.dart';
import '../module1/base_bean_entity.dart';
import '../module1/area_code_entity.dart';
import '../module1/user_entity.dart';
import 'dart:convert';

import 'HomePage.dart';
import 'ActivityPage.dart';
import 'MyPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//不加这一句with SingleTickerProviderStateMixin 此处报错TabController(vsync: this,length: 3);
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  RenderObject renderObject;



  //简单get请求
  void _dioGet() async {
//    Dio dio = new Dio();
//    Response response =  dio.get("http://www.baidu.com") as Response;
//
//
//    print("http==="+response.toString());

    try {
      Response response = await Dio().get(
          "https://api.apiopen.top/getJoke?page=1&count=2&type=video");
      print("===response====" + response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void _incrementCounter() {
//    _dioGet();

//    _dioGetSuper(); //封装网络请求get
    _dioJsonTest();//测试数据解析，封装basebean处理泛型问题

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Element element;

  TabController controller;
  int currentIndex = 0;

  //第二种方式导航，初始化页面数组
  final List<Widget> children = [HomePage(), ActivityPage(), MyPage()];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text("Home"),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme
//                  .of(context)
//                  .textTheme
//                  .display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
////        onPressed: _incrementCounter,
//        onPressed: _jumpToNative,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );


//第一种实现底部导航
//    return new Scaffold(
//    body: TabBarView(controller: controller,children: [
//      new HomePage(),
//      new ActivityPage(),
//      new MyPage()
//    ],),
//    bottomNavigationBar: new Material(
//      color: Colors.blue,
//      child: new TabBar(controller: controller,
//        isScrollable: false,
//        indicatorColor: Colors.transparent,
//        tabs: [
//       new Tab(text: "首页",icon: new Icon(Icons.ac_unit),),
//       new Tab(text: "活动",icon: new Icon(Icons.local_activity),),
//       new Tab(text: "个人",icon: new Icon(Icons.person),),
//      ],),
//    ),
//  );


    _incrementCounter();


    //第二种方式
    return new Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: children,
      ),

      //将BottomNavigationBar替换为CupertinoTabBar就是IOS风格
      bottomNavigationBar: CupertinoTabBar(currentIndex:currentIndex,

          onTap: onTabTaped
          ,items: [
        new BottomNavigationBarItem(title: new Text("首页"),icon: new Icon(Icons.ac_unit),),
        new BottomNavigationBarItem(title: new Text("活动"),icon: new Icon(Icons.local_activity),),
        new BottomNavigationBarItem(title: new Text("个人"),icon: new Icon(Icons.person),),
      ]),

    );
  }


    //第三种实现方式


    //追踪导航索引
    void onTabTaped(int index) {
      setState(() {
        currentIndex = index;
      });
    }



  void _dioJsonTest() {
    var areaCodeUrl = "https://newtest.e-moneyclip.com/api/account/v1/user/findAreaCodes";
    var findUrl = "http://192.168.1.94:8081/test/users";
    NetController.getData(findUrl,(data){
      print("----------areacode="+data.toString());

      //针对网络请求result字段返回数组情况
//     var areaCodeList =  BaseBeanEntity.fromJsonList(json.decode(data.toString())).getList<AreaCodeEntity>();
      //     areaCodeList.forEach((v){
//       print("----------areacode=name="+v.name+"--country="+v.countryCode);
//     });

      //针对网络请求result字段返回对象情况
     var find =  BaseBeanEntity.fromJson(json.decode(data.toString())).getObject<UserEntity>();
      print("----------user=email="+find.userEmail+"--name="+find.userName);




    });
  }
  }

  void _dioGetSuper() {
//  Map<String,String> map = new Map();

    var map = {"page": "1",
      "count": "2",
      "type": "video"};
    NetController.getData("https://api.apiopen.top/getJoke", (data) {
      print("---------onsuccess-----" + data.toString());
    }, params: map);
  }
