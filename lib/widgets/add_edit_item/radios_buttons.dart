import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditItemRadiosButtons extends StatelessWidget {
  final IsActive isItemActive;
  const AddEditItemRadiosButtons({super.key, required this.isItemActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.blue,
              child: RadioListTile(
                activeColor: AppColors.primaryColor1,
                  title: Text("active"),
                  value: IsActive.active,
                  groupValue: isItemActive,
                  onChanged: (value) {
                    context.read<AddEditItemCubit>().activeItem();
                  }),
            )),
        Expanded(
            child: RadioListTile(
                activeColor: AppColors.primaryColor1,
                value: IsActive.notActive,
                title: Text("inactive"),
                groupValue: isItemActive,
                onChanged: (value) {
                  context.read<AddEditItemCubit>().inactiveItem();
                })),
      ],
    );;
  }
}
