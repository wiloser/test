import 'dart:convert';

import 'package:dio/dio.dart';

class RequestMethods {
  final String method;
  final String path;
  final Map<String, dynamic>? data;
  static const String baseUrl = 'http://localhost:8000'; // 主机URL

  RequestMethods(this.method, this.path, this.data);

  static Future<Response> _post(
    String path, {
    Map<String, dynamic>? data,
  }) {
    return _sendRequest('post', path, data: data);
  }

  static Future<Response> _get(
    String path, {
    Map<String, dynamic>? data,
  }) {
    return _sendRequest('get', path, data: data);
  }

  static Future<Response> _sendRequest(
    String method,
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final dio = Dio();

    final options = Options(
      headers: {'Authorization': 'Bearer your_access_token'}, // 添加请求头
    );

    try {
      Response response;

      switch (method.toLowerCase()) {
        case 'get':
          response = await dio.get(
            '$baseUrl$path',
            queryParameters: data,
            options: options,
          );
          break;
        case 'post':
          response = await dio.post(
            '$baseUrl$path',
            data: data,
            options: options,
          );
          break;
        default:
          throw ArgumentError('Unsupported HTTP method: $method');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }
}

class Api {
  Api();
  static Future<Response> login() async {
    return RequestMethods._post('/api/login');
  }

  static Future<Response> getQuestion() async {
    return RequestMethods._get('/api/getQuestion');
  }
}
Future<dynamic> searchMovies({String? key}) async {
  final String apiUrl = 'https://api.douban.com/v2/movie/search?q=${key ?? '%E5%93%88%E5%88%A9'}';
  const String apiKey = '0ab215a8b1977939201640fa14c66bab';

  try {
    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'apikey': apiKey,
      },
    );

    if (response.statusCode == 200) {
      // 请求成功
      Map<String, dynamic> data = json.decode(response.toString());
      print('电影搜索结果： $data');
      return data;
    } else {
      // 请求失败
      print('请求失败，状态码: ${response.statusCode}');
      return Map<String, dynamic>(); // 返回一个空的Map，表示失败
    }
  } catch (e) {
    // 发生异常
    print('发生异常: $e');
    return Map<String, dynamic>(); // 返回一个空的Map，表示发生异常
  }
}