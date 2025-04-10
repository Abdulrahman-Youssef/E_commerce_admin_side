import 'dart:io';
import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditItemImagePicker extends StatelessWidget {
  final void Function()? onTap;
  final File? imageFile;

  const AddEditItemImagePicker({
    super.key,
    required this.onTap,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddEditItemCubit>();
    final imageUrl =
        "${AppLinks.localeServerPhysicalDevice}${cubit.item?.itemsImage ?? ''}";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: AppColors.primaryColor1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: imageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              )
            : FutureBuilder<bool>(
                future: cubit.showEditeImage(imageUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data == true) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return _defaultPlaceholder();
                        },
                      ),
                    );
                  }

                  return _defaultPlaceholder();
                },
              ),
      ),
    );
  }

  Widget _defaultPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.image, size: 50, color: Colors.green),
          SizedBox(height: 8),
          Text(
            "Tap to upload image",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
