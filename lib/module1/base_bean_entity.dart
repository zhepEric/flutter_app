import 'package:flutter_app/entity_factory.dart';

class BaseBeanEntity<T> {
  String message;
//  dynamic status;
  Map<String, dynamic> result;
  List<dynamic> resultList;

  BaseBeanEntity({this.message, this.result, this.resultList});

  //处理result对象情况

  BaseBeanEntity.fromJson(Map<String, dynamic> json) {
    result = json["result"];
    message = json['message'];
//    status = json['status'];
  }

  //处理result为数组情况
  BaseBeanEntity.fromJsonList(Map<String, dynamic> json) {
    resultList = json["result"];
    message = json['message'];
//    status = json['status'];
  }

  //获取对象
  T getObject<T>() {
    return EntityFactory.generateOBJ<T>(result);
  }

  //获取数组
  List<T> getList<T>() {
    var list = List<T>();

    if (resultList != null) {
      resultList.forEach((v) {
        list.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return list;
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["message"] = this.message;
//    data["status"] = this.status;

    if(this.result != null){
      data["result"] = this.result;

    }

    return data;
  }
}
