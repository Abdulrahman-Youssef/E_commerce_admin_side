import 'package:admin_app/data/database/crud.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:http/http.dart' as http;

class LoginData {
  Crud crud = Crud();

  Future<http.Response?> login(String userName, String password) async {
    Map<String , String> data ;
    http.Response? response = await crud.post(
      AppLinks.login,
        {
          "adminName": userName,
          "password": password,
        },
    );


    return response;
  }
}
