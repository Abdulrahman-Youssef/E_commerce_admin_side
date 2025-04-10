import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/cubits/home_page_cubit/home_page_cubit.dart';
import 'package:admin_app/cubits/home_page_cubit/home_page_state.dart';
import 'package:admin_app/services/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/home/home_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          leading: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<HomePageCubit>().logout( context);
                },
                icon: Icon(Icons.exit_to_app_outlined));
          }),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ScreenUtil.screenWidth * .1,
                mainAxisSpacing: ScreenUtil.screenWidth * .1,
                childAspectRatio: 1.3,
              ),
              children: [
                HomeListTile(
                  name: "Manage Items",
                  imageName: AppImages.products,
                  onTap: () => context.push(AppRoutes.manageItems),
                ),
                HomeListTile(
                  name: "Manage users",
                  imageName: AppImages.users,
                  onTap: () {
                    context
                        .read<HomePageCubit>()
                        .manageUsersScreen(context);
                  },
                ),
                HomeListTile(
                  name: "Manage notifications",
                  imageName: AppImages.notifications,
                  onTap: () => context.read<HomePageCubit>().manageUsersScreen,
                ),
                HomeListTile(
                  name: "Manage reports",
                  imageName: AppImages.reports,
                  onTap: () => context.read<HomePageCubit>().manageUsersScreen,
                ),
                HomeListTile(
                  name: "Manage Orders",
                  imageName: AppImages.orders,
                  onTap: () => context.read<HomePageCubit>().manageUsersScreen,
                ),
                HomeListTile(
                  name: "Manage categories",
                  imageName: AppImages.categories,
                  onTap: () => context.read<HomePageCubit>().manageUsersScreen,
                ),
                HomeListTile(
                  name: "Manage admins",
                  imageName: AppImages.admins,
                  onTap: () => context.read<HomePageCubit>().manageUsersScreen,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
