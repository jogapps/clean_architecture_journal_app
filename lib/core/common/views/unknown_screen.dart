import 'package:flutter/material.dart';
import 'package:journal_app/core/common/widgets/gradient_background.dart';
import 'package:journal_app/core/res/asset_images.dart';
import 'package:lottie/lottie.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({required this.payload, Key? key}) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(
            image: AssetImages.onBoardingBackground,
            child: Center(
              child: Lottie.asset(AssetImages.pageUnderConstruction),
            ),
          ),
          Positioned(bottom: 10, left: 0, right: 0, child: Text(payload))
        ],
      ),
    );
  }
}
