import 'package:goldenlamian/models/menu_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<MenuModel> fetchMenuList() {
    return _provider.fetchMenuList();
  }
}

class NetworkError extends Error {}
