import 'package:flutter/cupertino.dart';
import 'package:innerix_mvvm/model/user_products_model.dart';

import '../data/response/api_response.dart';
import '../respositories/home_respository.dart';

class HomeViewModel with ChangeNotifier {

  final myRepo = HomeRespository();

  ApiResponse<UserProductsModel> productsList = ApiResponse.loading();

  setProductsList(ApiResponse<UserProductsModel> response){

    productsList = response;
    notifyListeners();
  }

  Future<void> fetchProductsListApi() async{

    setProductsList(ApiResponse.loading());

    myRepo.fetchProductsListApi().then((value){

      setProductsList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setProductsList(ApiResponse.error(error.toString()));
    });
  }
}