import 'package:admin_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/classes/validation_form_field.dart';

class AddEditItemTextFiled extends StatelessWidget {
  final String? hint;

  final int? maxLines;

  final int? maxLength;

  final bool isNumbers;
  final String? Function(String?)? validate;

  final TextEditingController controller;

  const AddEditItemTextFiled(
      {super.key,
      this.maxLines,
      this.hint,
      this.maxLength,
      this.isNumbers = false,
      required this.controller,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: isNumbers ? TextInputType.number : TextInputType.multiline,
      validator: validate ?? FormValidator.isEmpty,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(23))),
      ),
      maxLength: maxLength,
    );
  }
}
