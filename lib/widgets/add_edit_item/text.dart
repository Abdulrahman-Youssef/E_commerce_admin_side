import 'package:admin_app/core/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AddEditItemText extends StatelessWidget {
  final String text ;
  const AddEditItemText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.thirdColor,
        fontSize: 20,
      ),
    );
  }
}
