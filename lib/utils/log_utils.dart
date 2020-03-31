
import 'package:flutter/services.dart';

class LogUtil {
  static const perform = const MethodChannel("com.example.flutterapp/log_print");

  static void i(String tag, String message){
    perform.invokeMethod('LogI',{'tag':tag,'message':message});
  }
}