import 'dart:io';

import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/data/database/crud.dart';
import 'package:http/http.dart';

class AddEditItemData {
  final Crud _crud = Crud();

  Future<StreamedResponse?> addItemWithImage(
      {required String name,
      required String description,
      required String price,
      required String isActive,
      required String stock,
      required String discount,
      required String categoryID,
      required File imageFile})
  {
    var response = _crud.postWithImage(
      url: AppLinks.addItemWithImage,
      data: {
        "item_name": name,
        "items_description": description,
        "item_price": price,
        "items_active": isActive,
        "items_count": stock,
        "items_discount": discount,
        "items_category": categoryID,
      },
      imageFile: imageFile,
    );
    return response;
  }

  Future<Response?> addItem({
    required String name,
    required String description,
    required String price,
    required String isActive,
    required String stock,
    required String discount,
    required String categoryID,
  })
  {
    var response = _crud.post(
      AppLinks.addItem,
      {
        "item_name": name,
        "items_description": description,
        "item_price": price,
        "items_active": isActive,
        "items_count": stock,
        "items_discount": discount,
        "items_category": categoryID,
      },
    );
    return response;
  }

  Future<StreamedResponse?> editeItemWithImage(
      {required String id,
      required String name,
      required String description,
      required String price,
      required String isActive,
      required String stock,
      required String discount,
      required String categoryID,
      required File? imageFile})
  {
    return _crud.postWithImage(
        url: AppLinks.editItemWithImage,
        data: {
          "items_id" : id,
          "items_name": name,
          "items_description": description,
          "item_price": price,
          "items_active": isActive,
          "items_count": stock,
          "items_discount": discount,
          "items_category": categoryID,
        },
        imageFile: imageFile);
  }


  Future<Response?> deleteItem(int itemID){
    var response =  _crud.delete(AppLinks.deleteItem, itemID);
    return response;
  }

//-----------------end
}
