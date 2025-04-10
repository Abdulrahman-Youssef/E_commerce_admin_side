import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/constant/enum/add_item_screen_mode.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddEditButton extends StatelessWidget {
  const AddEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor1),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () async {
          bool success = await context.read<AddEditItemCubit>().invoke(context);
          if (success) {
            // dialgo or check ui thing
            context.go(AppRoutes.home);
          } else {
            context.go(AppRoutes.home);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.read<AddEditItemCubit>().mode ==
                enAddedItemMode.add) ...[
              Icon(Icons.add),
              Text("  add item"),
            ],
            if (context.read<AddEditItemCubit>().mode ==
                enAddedItemMode.edite) ...[
              Icon(Icons.edit),
              Text("  Edite item")
            ],
          ],
        ));
  }
}
