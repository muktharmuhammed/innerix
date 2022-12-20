
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiService.dart';
import '../resources/app_urls.dart';

class AuthRespository{

  final BaseApiServices _apiServices = NetworkApiService();

  Future <dynamic> loginApi( dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }

  Future <dynamic> signupApi( dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndpoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }

}