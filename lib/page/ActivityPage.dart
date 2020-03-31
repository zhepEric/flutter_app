import 'package:flutter/material.dart';
import 'package:flutter_app/provider/CounterModel.dart';
import 'package:flutter_app/utils/log_utils.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterModel counter = new CounterModel();

    LogUtil.i("ActivityPage", "----刷新整个页面--------");

    // TODO: implement build
    return ChangeNotifierProvider(
//   builder在Provider4.0废弃使用
//      builder: (context) => counter,
      child: new Material(
        child: new Scaffold(
          appBar: new AppBar(
            title: Text('活动页'),
          ),
//          body: Center(child: Consumer(builder:
//              (BuildContext context, CounterModel counterModel, Widget child) {
//            ///当点击加号按钮时只会更新局部数据
//            LogUtil.i("ActivityPage", "----刷新局部布局--------");
//            return Column(
//              children: <Widget>[
//                Text('counter1---=${counterModel.value}'),
//                Text('counter2---=${counterModel.valueA}'),
//                FloatingActionButton(
//                  onPressed: (){
//                    counter.incrementA();
//                  },
//                  child: Icon(Icons.message),
//                    heroTag:'counter2'
//                )
//              ],
//            );
//          })),

          //

          body: Center(
            child: Column(
              children: <Widget>[

                ///存在的问题：
                ///无论是点击那个Button都会引起Text1和Text2的重绘，这明显与我们使用Provider的初衷是违背的。而在实际的使用场景中，这种情况会带来比预想更差的UI表现。
//                Consumer(
//                  builder: (BuildContext context, CounterModel counterModel,
//                      Widget child) {
//                    LogUtil.i("ActivityPage", "----刷新局部布局--------");
//
//                    return Text('counter---=${counterModel.value}');
//                  },
//                ),
//                RaisedButton(
//                  onPressed: () {
//                    counter.increment();
//                  },
//                ),
//                Consumer(
//                  builder: (BuildContext context, CounterModel counterModelA,
//                      Widget child) {
//                    LogUtil.i("ActivityPage", "----刷新局部布局A--------");
//
//                    return Text('counter1---=${counterModelA.valueA}');
//                  },
//                ),
//                RaisedButton(
//                  onPressed: () {
//                    counter.incrementA();
//                  },
//                ),
                ///Provider的设计者毫无疑问也发现了这个问题，所以推出了Selector来解决这类问题。
                Text('采用Selector改造上述存在的问题----'),

                ///Selector控制的粒度比Consumer更细，Consumer是监听一个Provider中所有数据的变化，Selector则是监听某一个/多个值的变化。
                //设置泛型参数
                Selector<CounterModel,int>(
                  builder: (_, data, __) {
                    LogUtil.i("ActivityPage", "----刷新局部布局--------");

                    return Text('counter---=${data}');

                  },
                  selector: (_, counterModel) => counterModel.value,

                ),
                RaisedButton(
                  child:Text('Selecotr ') ,
                  onPressed: () {
                    counter.increment();
                  },
                ),
                Selector<CounterModel,int>(
                  builder: (BuildContext context, data, Widget child) {
                    LogUtil.i("ActivityPage", "----刷新局部布局A--------");

                    return Text('counterA---=${data}');
                  },
                  selector: (BuildContext context, CounterModel counterModel) =>  counterModel.valueA,
                ),
                RaisedButton(
                  child:Text('Selecotr A') ,
                  onPressed: () {
                    counter.incrementA();
                  },
                ),
              ],
            ),
          ),

          //Consumer 实现局部刷新
          floatingActionButton:
//          Consumer(
//              builder: (context, CounterModel counterModel, child) =>
              FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),

            ///在子树中有多个Hero 对象共用了一个tag，每个Hero对象的tag必须是惟一的。
            heroTag: 'second',
          ),
        ),
//        )
      ),
      create: (BuildContext context) => counter,
    );
  }
}
