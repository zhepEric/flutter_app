import 'package:dio/dio.dart';

class NetController {

  //GET请求封装
  static getData(String url, Function successCallback,
      {String method,
      Map<String, String> params,
      Function errorCallback}) async {
    if (params != null) {
      StringBuffer stringBuffer = new StringBuffer("?");

      //循环遍历
      params.forEach((key, value) {
        stringBuffer.write("$key" + "=" + "$value" + "&");
      });

      String paramsResult = stringBuffer.toString();
      paramsResult = paramsResult.substring(0, paramsResult.length - 1);
      url += paramsResult;
      print("------params="+url);

    }

    //指定参数名称可以不安顺序设置
    _request(url, successCallback,
        method: "GET", params: params, errorCallback: errorCallback);
  }

  static _request(String url, Function successCallback,
      {String method,
      Map<String, String> params,
      Function errorCallback}) async {
    try {
      Response response;

      //初始化配置
//      BaseOptions baseOptions =
//          new BaseOptions(connectTimeout: 60, receiveTimeout: 60);
//
//      Options options = new Options(connectTimeout: 60, receiveTimeout: 60);
      Dio dio = new Dio();

      if (method == "GET") {
        response =
            await dio.get(url, queryParameters: params);
        print("----dataresult=${response.toString()}");

      } else if (method == "POST") {
        response =
            await dio.post(url, queryParameters: params);
      }

      int status = response.statusCode;
      //请求成功
      if (status == 200) {
        if (successCallback != null) {
          successCallback(response);
          print("----data=${response.toString()}");
        }
      }
    } catch (e) {}
  }
}
