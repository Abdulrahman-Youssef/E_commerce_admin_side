import 'package:admin_app/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/login/login_state.dart';

class LoginTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? valid;
  final bool isPassword;
  final  bool hideText = false;

  const LoginTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return TextFormField(
        validator: valid,
        obscureText: isPassword == true ? state.isPasswordHidden : false,
        controller: controller,
        decoration: InputDecoration(
          errorText: state.wrongUserNamePassword ? "wrong Name or password"  : null,
          contentPadding: EdgeInsets.only(left: 14, top: 30),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    hideText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    // Toggle password visibility
                    context.read<LoginCubit>().changePasswordVisibilityState();
                  },
                )
              : null,
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.grey[400],
        ),
      );
    });
  }
}
