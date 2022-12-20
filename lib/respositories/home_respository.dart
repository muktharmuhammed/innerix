
import 'package:innerix_mvvm/model/user_products_model.dart';
import 'package:innerix_mvvm/view_model/user_view_model.dart';

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiService.dart';
import '../resources/app_urls.dart';

class HomeRespository{

  final BaseApiServices _apiServices = NetworkApiService();

  Future <UserProductsModel> fetchProductsListApi() async {
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.homeItems);
      return response = UserProductsModel.fromJson(response);
    }
    catch(e){
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}