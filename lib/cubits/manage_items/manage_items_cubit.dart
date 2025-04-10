import 'dart:convert';

import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/constant/enum/add_item_screen_mode.dart';
import 'package:admin_app/core/constant/enum/screen_state.dart';
import 'package:admin_app/cubits/manage_items/manage_items_state.dart';
import 'package:admin_app/data/database/added_item_data.dart';
import 'package:admin_app/data/database/manage_items_data.dart';
import 'package:admin_app/data/model/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ManageItemsCubit extends Cubit<ManageItemsState> {
  ManageItemsCubit() : super(ManageItemsState()) {
    initialData();
  }

  ManageItemsData manageItemsData = ManageItemsData();
  Map<String, dynamic>? body = {};

  AddEditItemData addEditItemData = AddEditItemData();

  initialData() async {
    try {
      emit(state.copyWith(
        screenState: ScreenState.loading,
      ));

      Response? response = await manageItemsData.getAllItems();
      if (response == null) {
        body = null;
        print("response is null");
        emit(state.copyWith(
          screenState: ScreenState.failure,
        ));
        return;
      }

      body = jsonDecode(response.body);
      if (body == null || body!["data"] == null) {
        print("body is null");

        emit(state.copyWith(items: null, screenState: ScreenState.failure));
        return;
      }

      emit(state.copyWith(
          items: (body!["data"] as List)
              .map((e) => ItemModel.fromJson(e))
              .toList()));
    } catch (e) {}

    emit(state.copyWith(
      screenState: ScreenState.success,
    ));
  }

  //
  void toAddItem(BuildContext context) {
    context.push(AppRoutes.addItem, extra: {"mode": enAddedItemMode.add});
  }

  void toEditeItem(BuildContext context , int itemID) {

    ItemModel item =  state.items!.firstWhere((item){
      return item.itemsId == itemID;
    });



    context.push(AppRoutes.addItem,
        extra: {"mode": enAddedItemMode.edite, "item": item});
  }




  Future<bool> deleteItem(BuildContext context ,  int itemID)async{
    var response = await addEditItemData.deleteItem(itemID);
    if (response != null && response.statusCode == 200) {
      // Success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Item deleted successfully!")),
      );
      return true;

    } else {
      // Failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete item")),
      );
      return false;

    }
  }


}
