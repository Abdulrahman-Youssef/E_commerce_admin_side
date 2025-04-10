import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isPasswordHidden;
  final bool wrongUserNamePassword;

  const LoginState({
    this.isLoading = false,
    this.isPasswordHidden = true,
    this.wrongUserNamePassword = false,
  });

  LoginState copyWith({bool? isLoading, bool? isPasswordVisible , bool? wrongUserNamePassword}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordHidden: isPasswordVisible ?? this.isPasswordHidden,
      wrongUserNamePassword: wrongUserNamePassword ?? this.wrongUserNamePassword,
    );
  }

  @override
  List<Object?> get props => [isLoading, isPasswordHidden , wrongUserNamePassword];
}
