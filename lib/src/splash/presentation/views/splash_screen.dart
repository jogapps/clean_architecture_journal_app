import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/core/common/widgets/gradient_background.dart';
import 'package:journal_app/core/res/asset_images.dart';
import 'package:journal_app/core/routes/app_routes.dart';
import 'package:journal_app/src/splash/presentation/cubit/splash_cubit.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().loadingSplash();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Navigator.popAndPushNamed(context, AppRoutes.onBoarding);
        }
      },
      child: Scaffold(
        body: GradientBackground(
          image: AssetImages.onBoardingBackground,
          child: Center(
            child: Lottie.asset(AssetImages.loading),
          ),
        ),
      ),
    );
  }
}
