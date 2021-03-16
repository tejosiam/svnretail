import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map data;

  ApiRequest({
    @required this.url,
    this.data,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(headers: {
      'Authorization': 'Basic ZDN3NFMxYW06Tm92NCEjI2QzdzQ=',
    }));
  }

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
