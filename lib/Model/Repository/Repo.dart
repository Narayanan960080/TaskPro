import 'package:task_pro/Model/Response/ProductListData.dart';


abstract class Repo{

  Future<ProductListData?> getProductList(Map<String,dynamic> params) async {
    return null;
  }


}