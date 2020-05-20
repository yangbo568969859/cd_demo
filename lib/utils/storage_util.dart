import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences sp;
  static initSp() async{
    sp = await SharedPreferences.getInstance();
  }

  /// fluro 传递中文参数前，先转换，fluro 不支持中文传递
  static String fluroCnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }
  /// fluro 传递后取出参数，解析
  static String fluroCnParamsDecode(String encodeCn) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
  /// object 转为 string json
  static String object2string<T>(T t) {
    return fluroCnParamsEncode(jsonEncode(t));
  }
  /// string json 转为 map
  static Map<String, dynamic> string2map(String str) {
    return json.decode(fluroCnParamsDecode(str));
  }
}