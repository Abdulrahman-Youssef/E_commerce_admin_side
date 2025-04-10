import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../services/screen_util.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({super.key, required this.name, required this.imageName, required this.onTap});

  final String name;
  final String imageName;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
            bottom: ScreenUtil.screenHeight * .005,
            top: ScreenUtil.screenHeight * .005),
        decoration: BoxDecoration(
          color: AppColors.backGround,
          border: Border.all(color: AppColors.primaryColor),
        ),
        alignment: Alignment.center,
        width: ScreenUtil.screenWidth * .2,
        child: Column(children: [
          Image.asset(
            imageName,
            width: ScreenUtil.screenWidth * .23,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ]),
      ),
    );
  }
}
