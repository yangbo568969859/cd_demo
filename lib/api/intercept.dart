// # 拦截器
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

import 'package:data_analysis/utils/storage_util.dart';

class TokenInterceptor extends InterceptorsWrapper {
  String _token;
  static const TOKEN_KEY = "token";

  @override
  onRequest(RequestOptions options) async {
    if (_token == null) {
      print('无 _token');
    }
    options.headers["Authorization"] = _token;
    return options;
  }

  @override
  Future onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        await LocalStorage.sp.setString(TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return super.onResponse(response);
  }

  @override
  onError(DioError e) async {
    print(e);
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    LocalStorage.sp.remove(TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token1 = await LocalStorage.sp.get('token');
    if (token1 != null) {
      Map<String, dynamic> token2 = convert.jsonDecode(token1);
      return token2['token_type'] + ' ' + token2['access_token'];
    } else {
      return 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkQ1QkFEQzlCQzdEOUYyRjg1MjA1MDZBQTBCMTgzQkIzRkZCOUMwMTUiLCJ0eXAiOiJKV1QiLCJ4NXQiOiIxYnJjbThmWjh2aFNCUWFxQ3hnN3NfLTV3QlUifQ.eyJuYmYiOjE1ODkyNjQzNTYsImV4cCI6MTU5MDU2MDM1NiwiaXNzIjoiaHR0cDovLzEyNy4wLjAuMTo0NzMzOCIsImF1ZCI6WyJodHRwOi8vMTI3LjAuMC4xOjQ3MzM4L3Jlc291cmNlcyIsImFjY291bnQiLCJjYXRlZ29yeV9icmFuZCIsImRpc2NvdmVyeSIsImZ1bmQiLCJpdGVtIiwibG9naXN0aWNzIiwicGF5bWVudCIsInNldHRpbmciLCJzaG9wIiwidHJhZGVfcmVmdW5kIiwidXNlciJdLCJjbGllbnRfaWQiOiJhcHAiLCJzdWIiOiIxMDU4IiwiYXV0aF90aW1lIjoxNTg5MjY0MzU2LCJpZHAiOiJsb2NhbCIsImlkIjoiMTA1OCIsImFjY291bnRfaWQiOiIyIiwibG9naW5fcGxhdGZvcm0iOiJidXllciIsInV1aWQiOiIyOWM2MWI2ZWI0MDE0NDQ0ODFmY2JhZjhlZmZjOGMxMSIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJhY2NvdW50IiwiY2F0ZWdvcnlfYnJhbmQiLCJkaXNjb3ZlcnkiLCJmdW5kIiwiaXRlbSIsImxvZ2lzdGljcyIsInBheW1lbnQiLCJzZXR0aW5nIiwic2hvcCIsInRyYWRlX3JlZnVuZCIsInVzZXIiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsidmVyaWZ5Y29kZSJdfQ.WsRYevN25URCueeOSTrZrK7X_DzVsrMNwWXXi18KZcr0ub947f5_wRbzAKrOvkdYBOlGOaqEbVC6vH7dIH2th2yZVJEraQkdWMA1tMcpwHZSy9J5C-LBOq2ZW8uaBQfFZmuwxNmSNMfFZaHV5NPQiOE_EA2ZtcdJa6YApTxYm19dxfofIc3RcZDlS2p4rLOjO3tK0Y8-ajP20oVdAohwpRDfQsoBd6xyM1diGznD7yl44eVn_ruDRc2RYxf_7rqe5L3SitFScKX_8fYWLw5uL_-9wIjhR0XDqsUPafizXQw2nqK65BTIv8EfTCpOULLf6fmJHVHKz2xRhRAnIMLPQQ';
    }
  }
} 