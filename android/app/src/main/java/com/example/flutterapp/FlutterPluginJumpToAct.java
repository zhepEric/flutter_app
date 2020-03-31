package com.example.flutterapp;

import android.app.Activity;
import android.content.Intent;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * @Author piaozhe
 * @Date 2019/12/26 13:46
 */
public class FlutterPluginJumpToAct implements MethodChannel.MethodCallHandler {
    public static String CHANNEL = "com.example.flutterapp/plugin";

    static MethodChannel channel;

    private Activity activity;

    private FlutterPluginJumpToAct(Activity activity) {
        this.activity = activity;
    }


    public static void registerWith(PluginRegistry.Registrar registrar){
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterPluginJumpToAct instance = new FlutterPluginJumpToAct(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }
    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        //接收来自flutter 的跳转路径指令
        if (methodCall.method.equals("actone")){
            Intent intent = new Intent(activity,OneActivity.class);
            activity.startActivity(intent);

            //返回成功参数给flutter
            result.success("success");
        }else {
            result.notImplemented();
        }
    }
}
