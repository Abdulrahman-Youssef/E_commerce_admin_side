import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/core/constant/enum/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingView extends StatelessWidget {
  final ScreenState statusRequest;
  final Widget widget;

  const HandlingView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == ScreenState.loading
        ? Center(
            child: Lottie.asset(
            AppImages.loading1,
            width: 250,
            height: 250,
          ))
        : statusRequest == ScreenState.offlineFailure
            ? Center(
                child: Lottie.asset(AppImages.offline1),
              )
            : statusRequest == ScreenState.serverFailure
                ? Center(
                    child: Lottie.asset(AppImages.serverError2),
                  )
                : statusRequest == ScreenState.failure
                    ? Center(
                        child: Column(
                          children: [
                            Lottie.asset(AppImages.noData1),
                            const Text(
                              "no  data",
                              style: TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                      )
                    : statusRequest == ScreenState.success
                        ? widget
                        : widget;
  }
}
