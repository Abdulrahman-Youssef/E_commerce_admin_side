import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/data/database/crud.dart';
import 'package:http/http.dart';

class ManageItemsData{

  Crud  crud = Crud();

  Future<Response?> getAllItems() async{
    return await crud.get(AppLinks.getAllItems, {});
  }


}