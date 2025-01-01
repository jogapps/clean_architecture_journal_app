import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/core/common/views/loading_views.dart';
import 'package:journal_app/core/theme/colors.dart';
import 'package:journal_app/src/onboarding/domain/entities/page_content.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:journal_app/src/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OnBoardingCubit>().getMotivationalMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          if (state is OnboardingLoading) {
            return const LoadingView();
          } else if (state is OnboardingLoaded) {
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    const OnBoardingBody(pageContent: PageContent.first()),
                    const OnBoardingBody(pageContent: PageContent.second()),
                    OnBoardingBody(
                        pageContent:
                            PageContent.third(desc: state.message.message)),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, 0.04),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index) {
                      pageController.animateTo(
                        index as double,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 40,
                      activeDotColor: KColors.primary,
                      dotColor: Colors.white,
                    ),
                  ),
                )
              ],
            );
          } else if (state is OnboardingError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Welcome!'));
        },
      ),
    );
  }
}
