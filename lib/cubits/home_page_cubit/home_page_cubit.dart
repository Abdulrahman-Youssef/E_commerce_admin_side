import 'package:admin_app/cubits/home_page_cubit/home_page_state.dart';
import 'package:admin_app/cubits/login/login_state.dart';
import 'package:admin_app/services/Shared_Preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/app_routes.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState()) {
    init();
  }



  SharedPreferencesService? pref;

  Future<void> init() async {
    pref = await SharedPreferencesService.getInstance();
  }

  void logout(BuildContext context) {
    pref!.clearData();
    context.go(AppRoutes.login);
  }

  void manageItemsScreen(BuildContext context) {
    context.push(AppRoutes.manageItems);
  }

  void manageUsersScreen(BuildContext context) {
    context.push(AppRoutes.manageUsers);
  }

  void manageAdminsScreen(BuildContext context) {
    context.push(AppRoutes.manageUsers);
  }
}
