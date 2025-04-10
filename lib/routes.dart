import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/constant/enum/add_item_screen_mode.dart';
import 'package:admin_app/cubits/add_edit_item/add_edit_item_cubit.dart';
import 'package:admin_app/cubits/home_page_cubit/home_page_cubit.dart';
import 'package:admin_app/cubits/login/login_cubit.dart';
import 'package:admin_app/cubits/manage_items/manage_items_cubit.dart';
import 'package:admin_app/cubits/manage_users/manager_users_cubit.dart';
import 'package:admin_app/data/model/item_model.dart';
import 'package:admin_app/services/Shared_Preferences.dart';
import 'package:admin_app/view/added_edit_item.dart';
import 'package:admin_app/view/home_page.dart';
import 'package:admin_app/view/manage_items/manage_items_screen.dart';
import 'package:admin_app/view/manage_users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:admin_app/view/auth/login.dart';

// Import your Cubit
final GoRouter routes = GoRouter(
  initialLocation: AppRoutes.login,
  routes: <RouteBase>[
    GoRoute(
      redirect: checkLogin,
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(
          router: GoRouter.of(context),
        ),
        child: const Login(),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomePageCubit(),
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.manageUsers,
      builder: (context, state) => BlocProvider(
        create: (context) => ManagerUsersCubit(),
        child: ManageUsersPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.manageItems,
      builder: (context, state) => BlocProvider(
        create: (context) => ManageItemsCubit(),
        child: ManageItemsScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.addItem,
      builder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        enAddedItemMode mode = data["mode"];
        ItemModel? item = data["item"];
        return BlocProvider(
          create: (context) => AddEditItemCubit(
            mode: mode,
            item: item,
          ),
          child: AddEditItem(),
        );
      },
    ),
  ],
);

Future<String?> checkLogin(BuildContext context, GoRouterState state) async {
  SharedPreferencesService pref = await SharedPreferencesService.getInstance();
  bool isLogin = pref.getIsLoggedIn();
  if (!isLogin) {
    return AppRoutes.login;
  } else {
    return AppRoutes.home;
  }
}
