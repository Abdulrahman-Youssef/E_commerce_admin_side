import 'package:admin_app/core/classes/handling_View.dart';
import 'package:admin_app/cubits/manage_items/manage_items_cubit.dart';
import 'package:admin_app/cubits/manage_items/manage_items_state.dart';
import 'package:admin_app/widgets/manageItemsScreen/card_item_listTile.dart';
import 'package:admin_app/widgets/manageItemsScreen/manage_items_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageItemsScreen extends StatelessWidget {
  const ManageItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Items"),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<ManageItemsCubit, ManageItemsState>(
          builder: (context, state) {
        return HandlingView(statusRequest: state.screenState ,
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search bar
                ManageItemsSearchBar(),
                const SizedBox(height: 16),
                // Item List
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items?.length,
                    // Replace with your actual item count
                    itemBuilder: (context, index) {
                      return CardItemListTile(
                        item: state.items![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),

      // Add Item Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ManageItemsCubit>().toAddItem(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
