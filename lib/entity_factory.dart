import 'package:flutter_app/module1/area_code_entity.dart';
import 'package:flutter_app/module1/country_bean_entity.dart';
import 'package:flutter_app/module1/user_entity.dart';
//插件自动生成的entity_factory
class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AreaCodeEntity") {
      return AreaCodeEntity.fromJson(json) as T;
    } else if (T.toString() == "CountryBeanEntity") {
      return CountryBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}