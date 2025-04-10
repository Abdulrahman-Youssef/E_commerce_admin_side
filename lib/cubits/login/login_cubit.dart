import 'dart:convert';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/cubits/login/login_state.dart';
import 'package:admin_app/data/database/login_data.dart';
import 'package:admin_app/data/model/admin.dart';
import 'package:admin_app/services/Shared_Preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.router}) : super(const LoginState()) {
    initialize();
  }

  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final GoRouter router;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late LoginData loginData = LoginData();
  late SharedPreferencesService pref;

  // init
  Future<void> initialize() async {
    pref = await SharedPreferencesService.getInstance();
    loginData = LoginData();

    userNameController.text = "Abdulrahman";
    passwordController.text = "Abdo@123456";
  }

  Future<void> _addAdminInfoToSharedPref(AdminModel admin) async {
    pref.setAdminID(admin.adminId!);
    pref.setAdminName(admin.adminName!);
    pref.setAdminEmail(admin.adminEmail!);
    pref.setAdminPhoneNumber(admin.adminPhoneNumber!);
    pref.setAdminCreatedDate(admin.adminCreatedDate!);
    pref.setAdminBinaryPermissionsNumber(admin.adminBinaryPermissionsNumber!);
    pref.setIsLoggedIn(true);
  }

  Future<bool> login(BuildContext context) async {
    //form valid
    Map<String, dynamic> responseBody;
    AdminModel admin;
    if (!formKey.currentState!.validate()) {
      print("============ text fields is null \n"
          " login = ${passwordController.text}  username ${userNameController.text}");
      // to remove the error if he inter wrong password then change it to invalid username or password
      emit(state.copyWith(wrongUserNamePassword: false));

      return false;
    }
    var response =
        await loginData.login(userNameController.text, passwordController.text);
    if (response == null) {
      // wrong when something wrong happen in CRUD
      print("wrong");
      return false;
    }

    if (!(response.statusCode >= 200 && response.statusCode < 300)) {
      print("password is wrong");
      emit(state.copyWith(wrongUserNamePassword: true));
      return false;
    }

    // now the admin is logged

    responseBody = json.decode(response.body);

    admin = AdminModel.fromJson(responseBody["data"]);

    await _addAdminInfoToSharedPref(admin);

    router.go(AppRoutes.home);

    return true;
  }

  void changePasswordVisibilityState() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordHidden));
  }

  void _dispose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Future<void> close() {
    _dispose();
    return super.close();
  }
}
