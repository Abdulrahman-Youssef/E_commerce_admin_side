import 'dart:io';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/constant/enum/add_item_screen_mode.dart';
import 'package:admin_app/core/constant/enum/categories.dart';
import 'package:admin_app/core/constant/enum/screen_state.dart';
import 'package:admin_app/core/function/dose_image_exist.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_state.dart';
import 'package:admin_app/data/database/added_item_data.dart';
import 'package:admin_app/data/model/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class AddEditItemCubit extends Cubit<AddEditItemState> {
  final enAddedItemMode mode;

  final ItemModel? item;

  AddEditItemCubit({required this.mode, this.item})
      : super(AddEditItemState()) {
    init();
  }

  AddEditItemData addedItemData = AddEditItemData();

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController discount = TextEditingController();

  File? imageFile;

  void init() {
    if (mode == enAddedItemMode.add) {
      return;
    }
    print("pass mode");
    if (item == null) {
      return;
    }
    // fill text filed
    name.text = item!.itemsName!;
    description.text = item!.itemsDescription!;
    price.text = item!.itemsPrice!.toString();
    discount.text = item!.itemsDiscount!.toString();
    stock.text = item!.itemsCount!.toString();

    //is active
    emit(state.copyWith(
        isItemActive:
            item!.itemsActive! == 1 ? IsActive.active : IsActive.notActive,
        selectedCategory: enCategories.fromId(item!.categoriesId!)));

    //menu bar
  }

  void activeItem() {
    emit(state.copyWith(isItemActive: IsActive.active));
    print(state.isItemActive);
  }

  void inactiveItem() {
    emit(state.copyWith(isItemActive: IsActive.notActive));
    print(state.isItemActive);
  }

  void changeSelectedCategory(enCategories selectedCategory) {
    emit(state.copyWith(selectedCategory: selectedCategory));
    print(
        'Selected category: ${selectedCategory.name}, ID: ${selectedCategory.id}');
    print(
        'Selected category: ${state.selectedCategory!.name}, ID: ${state.selectedCategory!.id}');
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imageFile = File(picked.path);
      emit(state.copyWith(
        imageFile: imageFile,
      )); // trigger rebuild
    }
  }

  Future<bool> addItem(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (state.imageFile != null) {
      print(name.text);

      var res = await addedItemData.addItemWithImage(
          name: name.text,
          description: description.text,
          price: price.text,
          isActive: state.isItemActive == IsActive.active ? "1" : "0",
          stock: stock.text,
          discount: discount.text,
          categoryID: state.selectedCategory!.id.toString(),
          imageFile: state.imageFile!);

      if (res != null) {
        final response = await Response.fromStream(res);
        print("Response: ${response.statusCode} ${response.body}");
      } else {
        print("No response from server");
        return false;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Item added successfully!")),
      );
      return true;
    }

    print("send with noooo image");
    var res =  await addedItemData.addItem(
      name: name.text,
      description: description.text,
      price: price.text,
      isActive: state.isItemActive == IsActive.active ? "1" : "0",
      stock: stock.text,
      discount: discount.text,
      categoryID: state.selectedCategory!.id.toString(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Item added successfully!")),
    );
    return true;
  }

  Future<bool> editItem(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    var res = await addedItemData.editeItemWithImage(
        id: item!.itemsId.toString(),
        name: name.text,
        description: description.text,
        price: price.text,
        isActive: state.isItemActive == IsActive.active ? "1" : "0",
        stock: stock.text,
        discount: discount.text,
        categoryID: state.selectedCategory!.id.toString(),
        imageFile: state.imageFile);

    if (res != null) {
      final response = await Response.fromStream(res);
      print("Response: ${response.statusCode} ${response.body}");
    } else {
      print("No response from server");
      return false;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Item edit successfully!")),
    );

    return true;
  }

  Future<bool> invoke(BuildContext context) async {
    bool result;
    emit(state.copyWith(isLoading: ScreenState.loading));

    if (mode == enAddedItemMode.add) {
      emit(state.copyWith(isLoading: ScreenState.success));
      result =  await addItem(context);
      return result;
    } else {
      emit(state.copyWith(isLoading: ScreenState.success));
      result =  await editItem(context);
      return  result;
    }
  }

  Future<bool> showEditeImage(String imageURL) async {
    if (mode != enAddedItemMode.edite) {
      print("not edite mode");
      return false;
    }
    if (item!.itemsImage! == "" && item!.itemsImage == null) {
      print("no items image path = ${item!.itemsImage}");
      return false;
    }
    if (!await doesImageExist(imageURL)) {
      print("url is wrong ${imageURL}");
      return false;
    }
    print("pass");
    return true;
  }

  void _dispose() {
    name.dispose();
    description.dispose();
    price.dispose();
    stock.dispose();
    discount.dispose();
  }

  @override
  Future<void> close() {
    _dispose();
    return super.close();
  }
//-----------end
}
