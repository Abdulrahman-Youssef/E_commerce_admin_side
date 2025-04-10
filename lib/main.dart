import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_theme.dart';
import 'package:admin_app/routes.dart';
import 'package:admin_app/services/screen_util.dart';
import 'package:admin_app/view/auth/login.dart';
import 'package:admin_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: primaryTheme,
      routerConfig: routes,
    );
  }
}
