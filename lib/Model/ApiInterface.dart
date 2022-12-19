
import 'package:task_pro/Model/Response/ProductListData.dart';

import 'ApiClient.dart';
import 'Repository/Repo.dart';
import 'ServerURL.dart';

class ApiInterface implements Repo {

  final ApiClient _apiService = ApiClient();


  @override
  Future<ProductListData?> getProductList(Map<String, dynamic> params) async {
    try {
      dynamic response = await _apiService.fetchData(ServerURL.getUrl(RequestType.categories),params);
      print("Response $response");
      final jsonData = ProductListData.fromJson(response);
      return jsonData;
    } catch (e) {
      print("Error $e}");
      rethrow;
    }
  }



}