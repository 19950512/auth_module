import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants.dart';
import '../interfaces/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  final baseUrl = Constants.baseUrl;

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    dio.options.headers['content-Type'] = 'application/json';

    try {
      var response = await dio.get(baseUrl + url);

      return response;
    } catch (e) {
      String mensagemErro = 'Não foi possível, tente novamente mais tarde.';

      return ({"r": "no", "data": mensagemErro});
    }
  }

  @override
  Future post(String endpoint, Object data) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['token'] = Constants.tokenTerceiro;

    try {
      var response = await dio.post(baseUrl + endpoint, data: jsonEncode(data));
      return response.data;
    } on DioError catch (e) {
      String mensagemErro = 'Não foi possível, tente novamente mais tarde.';
      return ({"r": "no", "data": mensagemErro});
    }
  }
}
