import 'package:flutter/material.dart';
import 'package:task_pro/Model/Response/ProductListData.dart';
import '../Model/ApiInterface.dart';
import '../Model/ApiResponse.dart';



class ProductListVM extends ChangeNotifier {
  final _myRepo = ApiInterface();

  ApiResponse<ProductListData> productsList = ApiResponse.loading();

  void _setProductListMain(ApiResponse<ProductListData> response) {
    print("Response :: $response");
    print(response.data);
    productsList = response;
    notifyListeners();
  }

  Future<void> fetchMyFamilyList(Map<String,dynamic> params) async {
    _setProductListMain(ApiResponse.loading());
    _myRepo.getProductList(params)
        .then((value) => _setProductListMain(ApiResponse.completed(value)));
        // .onError((error, stackTrace) => _setMyFamilyListMain(ApiResponse.error(error.toString())));
  }

}