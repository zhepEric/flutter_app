import 'package:flutter/material.dart';
import 'package:flutter_app/provider/CounterModel.dart';
import 'package:provider/provider.dart';
import '../utils/Utils.dart';
import 'package:rxdart/rxdart.dart';
class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashPageState();
  }

}

class SplashPageState extends State<SplashPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    _to_Main();

  _rxDelay();
  }
  @override
  Widget build(BuildContext context) {
    //获取Provider counter状态
//  final _counter = Provider.of<CounterModel>(context);

    // TODO: implement build
    return new Material(
      child: new Scaffold(
//        body: new Stack(
//          children: <Widget>[
//            new Container(
////              child: Image.asset(Utils.imagePath("splash_bg")),
//      child: Text('Splash----$_counter'),
//
//            ),
//            new FloatingActionButton(onPressed: (){
//              _to_Main();
//            print("----------onclick");
//            })
//          ],
//        ),

      //获取provider状态信息
      body: new Center(
        child: new Row(
          children: <Widget>[
            new Text(
//                'Splash Page------${_counter.value}'
                'Splash Page------'
            ),
//            new FloatingActionButton(onPressed: () {
//             _counter.increment();//改变状态
//              print("----------onclick");
//            })
          ],
        )
      ),

        ///Consumer 使用了 Builder 模式，收到更新通知就会通过 builder 重新构建。Consumer<T> 代表了它要获取哪一个祖先中的 Model。
        ///Consumer的经典之处在于能够在复杂项目中，极大地缩小你的控件刷新范围。
//        floatingActionButton: Consumer(
//          builder: (context, CounterModel counter,child) => FloatingActionButton(
//            onPressed: (){
////              counter.increment();
//              print("----------onclick");
//            },
//            child: child,
//          ),
//          child: Icon(Icons.add)
//        ) ,
      ),
    );
  }

  void _to_Main() {
//    Navigator.pushNamed(context,'/MyHomePage');//可行,不能传递参数，正常压栈操作
    Navigator.pushReplacementNamed(context, '/MyHomePage');// 可行，当页面跳转时，伴随着销毁，返回不到之前页面
  }

  void _rxDelay() {
//    Observable.just(1).defer(new Duration(milliseconds: 1000))
  
  Future.delayed(new Duration(milliseconds: 3000),(){
    _to_Main();
  });

  }

}
