import 'package:admin_app/core/classes/validation_form_field.dart';
import 'package:admin_app/cubits/login/login_cubit.dart';
import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/cubits/login/login_state.dart';
import 'package:admin_app/services/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/login/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child:
            BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              return Form(
                key: context
                    .read<LoginCubit>()
                    .formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'admin side',
                      style: TextStyle(fontSize: ScreenUtil.screenWidth * .1),
                    ),
                    SizedBox(
                      height: ScreenUtil.screenHeight * .02,
                    ),
                    Image(
                      image: AssetImage(AppImages.logo),
                      height: ScreenUtil.screenHeight * .25,
                    ),
                    SizedBox(
                      height: ScreenUtil.screenHeight * .08,
                    ),
                    LoginTextField(
                      hint: "user name",
                      controller: context
                          .read<LoginCubit>()
                          .userNameController,
                      valid: FormValidator.isValidUsername,
                    ),
                    SizedBox(
                      height: ScreenUtil.screenHeight * .04,
                    ),
                    LoginTextField(
                      hint: "password",
                      isPassword: true,
                      controller: context
                          .read<LoginCubit>()
                          .passwordController,
                      valid: FormValidator.isValidPassword,
                    ),
                    SizedBox(
                      height: ScreenUtil.screenHeight * .06,
                    ),
                    SizedBox(
                      height: ScreenUtil.screenHeight * .07,
                      width: ScreenUtil.screenWidth * .7,
                      child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<LoginCubit>().login(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue)),
                              child: Text("login"),
                            );
                          }),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
