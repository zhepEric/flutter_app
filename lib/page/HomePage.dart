import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/log_utils.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;
  //与原生交互
  static const jumpPlugin = const MethodChannel(
      "com.example.flutterapp/plugin");

  //跳转到原生，不带参数
  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod("actone");
    print("====jumpt=result=$result"); //如果成功跳转返回success参数提示
  }

  ///执行的第一个方法，一般做初始化操作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtil.i("HomePage", "---------initState--------");
  }

  ///生命周期中第二个会被执行的方法
  ///context 可以使用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LogUtil.i("HomePage", "---------didChangeDependencies--------");

  }

  ///接着执行该方法
  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtil.i("HomePage", "---------didUpdateWidget--------");

  }

  @override
  void dispose() {
    LogUtil.i("HomePage", "---------dispose--------");

    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    LogUtil.i("HomePage", "---------build--------");

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FloatingActionButton(
              onPressed: (){
                setState(() {
                  _counter++;

                });
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
        onPressed: _jumpToNative,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
