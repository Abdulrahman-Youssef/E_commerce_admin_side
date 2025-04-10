import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/enum/categories.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditItemDropdownMenu extends StatelessWidget {
  final enCategories? selectedCategory;

  const AddEditItemDropdownMenu({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<enCategories>(
      value: selectedCategory,
      // Default selected value
      isExpanded: true,
      items: enCategories.values.map((value) {
        return DropdownMenuItem<enCategories>(
            value: value,
            child: Text(
              value.name,
              style: TextStyle(
                  color: selectedCategory == value
                      ? AppColors.primaryColor1
                      : Colors.grey),
            ));
      }).toList(),
      onChanged: (enCategories? newValue) {
        print(newValue);
        // You can also print more details if needed:
        if (newValue != null) {
          context.read<AddEditItemCubit>().changeSelectedCategory(newValue);
        }
      },
      validator: (value) {
        if (value == null) return "please choose category first";
        return null;
      },
    );
  }
}
