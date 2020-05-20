
import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:data_analysis/api/intercept.dart';
import 'package:data_analysis/utils/toast_util.dart';


class HttpUtils {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  final TokenInterceptor _tokenInterceptor = TokenInterceptor();

  BaseOptions options = new BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 15000,
    receiveTimeout: 13000,
  );

  Dio dio = new Dio();

  HttpUtils() {
    print('HttpUtils 初始化');
    dio.interceptors.add(_tokenInterceptor);
  }

  netFetch(url, params, Options option, Map<String, dynamic> header) async {
    const bool inProduction = const bool.fromEnvironment("dart.vm.product");
    if (inProduction == true) {
      url = 'http://119.3.61.254:9988/router/rest?method=aqsea.'+url+'&version=v1';
    } else {
      url = 'http://119.3.61.254:9988/router/rest?method=aqsea.'+url+'&version=v1';
    }

    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get", responseType: ResponseType.plain);
      option.headers = headers;
    }
    Response response;
    resultError(DioError e) {
      showShortToast('请求出错了哦');
      print('请求出错了哦');
      Response errorResponse;
      print('${errorResponse.statusCode} ----- statusCode');
    }
    try {
      if (option.method == 'get' || option.method == 'DELETE') {
        response = await dio.request(url, queryParameters: params, options: option);
      } else {
        response = await dio.request(url, data: params, options: option);
      }
    } catch(e) {
      print('请求异常了');
      return resultError(e);
    }
    return response.data;
  }
}

final HttpUtils httpManager = new HttpUtils();