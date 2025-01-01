import 'package:flutter/material.dart';
import 'package:journal_app/core/common/widgets/gradient_background.dart';
import 'package:journal_app/core/res/asset_images.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GradientBackground(
        image: AssetImages.onBoardingBackground,
        child: Center(
          child: Lottie.asset(AssetImages.loading),
        ),
      ),
    );
  }
}
