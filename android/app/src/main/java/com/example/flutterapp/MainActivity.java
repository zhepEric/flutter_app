package com.example.flutterapp;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    FlutterPluginJumpToAct.registerWith(this.registrarFor(FlutterPluginJumpToAct.CHANNEL));

    //日志调用原生的
    LogMethodChannel.registerWith(this.registrarFor(LogMethodChannel.CHANNEL));
  }




  static class LogMethodChannel implements MethodChannel.MethodCallHandler{
    public static String CHANNEL = "com.example.flutterapp/log_print";

    static MethodChannel channel;


    public LogMethodChannel() {
    }

    public static void registerWith(PluginRegistry.Registrar registrar){
      channel = new MethodChannel(registrar.messenger(), CHANNEL);
      LogMethodChannel instance = new LogMethodChannel();
      //setMethodCallHandler在此通道上接收方法调用的回调
      channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
      logPrint(methodCall);
    }

    void logPrint(MethodCall methodCall){

      String tag = methodCall.argument("tag");
      String message = methodCall.argument("message");

      if (methodCall.method.equals("LogI")){

        Log.i(tag,message);
      }

    }
  }

}
