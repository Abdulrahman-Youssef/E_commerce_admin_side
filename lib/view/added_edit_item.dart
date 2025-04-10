import 'package:admin_app/core/classes/handling_View.dart';
import 'package:admin_app/core/classes/validation_form_field.dart';
import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/enum/add_item_screen_mode.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_state.dart';
import 'package:admin_app/widgets/add_edit_item/add_edite_button.dart';
import 'package:admin_app/widgets/add_edit_item/dropdown_menu.dart';
import 'package:admin_app/widgets/add_edit_item/image_picker.dart';
import 'package:admin_app/widgets/add_edit_item/radios_buttons.dart';
import 'package:admin_app/widgets/add_edit_item/text.dart';
import 'package:admin_app/widgets/add_edit_item/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditItem extends StatelessWidget {
  const AddEditItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (context.read<AddEditItemCubit>().mode == enAddedItemMode.add)
              ? Text("Add item")
              : Text('Edite item'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: BlocBuilder<AddEditItemCubit, AddEditItemState>(
                builder: (context, state) {
              return HandlingView(
                statusRequest: state.isLoading!,
                widget: Form(
                  key: context.read<AddEditItemCubit>().formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AddEditItemCubit, AddEditItemState>(
                            builder: (context, state) {
                          return AddEditItemImagePicker(
                            onTap: context.read<AddEditItemCubit>().pickImage,
                            imageFile: state.imageFile,
                          );
                        }),
                        SizedBox(height: 16),
                        AddEditItemText(
                          text: "Name",
                        ),
                        AddEditItemTextFiled(
                          controller: context.read<AddEditItemCubit>().name,
                          maxLength: 100,
                          maxLines: 1,
                        ),
                        AddEditItemText(
                          text: "Description",
                        ),
                        // max data base length is 155
                        AddEditItemTextFiled(
                          controller:
                              context.read<AddEditItemCubit>().description,
                          maxLength: 155,
                        ),
                        AddEditItemText(
                          text: "Price",
                        ),
                        AddEditItemTextFiled(
                          controller: context.read<AddEditItemCubit>().price,
                          isNumbers: true,
                        ),
                        AddEditItemText(
                          text: "Stock",
                        ),
                        AddEditItemTextFiled(
                          controller: context.read<AddEditItemCubit>().stock,
                          isNumbers: true,
                        ),
                        AddEditItemText(text: "Discount"),
                        AddEditItemTextFiled(
                          controller: context.read<AddEditItemCubit>().discount,
                          validate: FormValidator.isPercentage,
                          isNumbers: true,
                        ),
                        AddEditItemText(text: "is item active"),
                        BlocBuilder<AddEditItemCubit, AddEditItemState>(
                            builder: (context, state) {
                          return AddEditItemRadiosButtons(
                            isItemActive: state.isItemActive,
                          );
                        }),
                        AddEditItemText(text: "category"),
                        BlocBuilder<AddEditItemCubit, AddEditItemState>(
                            builder: (context, state) {
                          return AddEditItemDropdownMenu(
                            selectedCategory: state.selectedCategory,
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        AddEditButton(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
