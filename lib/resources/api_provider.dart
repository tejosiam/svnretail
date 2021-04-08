import 'package:dio/dio.dart';
import 'package:goldenlamian/models/menu_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _betaurl =
      'https://beta1.goldenlamian.com/endpoint/v2/menu/items';

  Future<MenuModel> fetchMenuList() async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] =
          "basic VGVzdGluZyMjMTI0ITpUZXN0aW5nIyMxMjMh";
      Response response = await _dio.post(_betaurl);
      return MenuModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MenuModel.withError("Data not found / Connection issue");
    }
  }
}
