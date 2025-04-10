import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/core/function/dose_image_exist.dart';
import 'package:admin_app/cubits/manage_items/manage_items_cubit.dart';
import 'package:admin_app/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItemListTile extends StatelessWidget {
  const CardItemListTile({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.itemsImage != null && item.itemsImage != ""
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FutureBuilder<bool>(
                      future: doesImageExist(
                          "${AppLinks.localeServerPhysicalDevice}/${item.itemsImage}"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2)),
                          );
                        }
                        if (snapshot.hasData && snapshot.data == true) {
                          return Image.network(
                            "${AppLinks.localeServerPhysicalDevice}/${item.itemsImage}",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          );
                        } else {
                          return const Icon(Icons.image, size: 80);
                        }
                      },
                    ),
                  )
                : Icon(Icons.image, size: 80),

            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemsName!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Price: \$${item.itemsPrice}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  if (item.itemsDiscount! > 0)
                    Text(
                      "Discount: ${item.itemsDiscount}%",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.green,
                          ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    "Category: ${item.categoriesName}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            // Action Buttons
            Column(
              children: [
                IconButton(
                  onPressed: () => context
                      .read<ManageItemsCubit>()
                      .toEditeItem(context, item.itemsId!),
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () => context
                      .read<ManageItemsCubit>()
                      .deleteItem(context, item.itemsId!),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
