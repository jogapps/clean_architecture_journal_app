import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/core/res/asset_images.dart';
import 'package:journal_app/core/theme/colors.dart';
import 'package:journal_app/core/theme/theme_style.dart';
import 'package:journal_app/src/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:journal_app/src/dashboard/presentation/widgets/highlight_card.dart';
import 'package:journal_app/src/dashboard/presentation/widgets/mood_trend_chart.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: KColors.teal,
        centerTitle: true,
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Center(child: Lottie.asset(AssetImages.loading));
          } else if (state is DashboardLoaded) {
            return ListView(
              padding: const EdgeInsets.all(PADDING_SM * 1.2),
              children: [
                MoodTrendChart(moodTrends: state.moodTrends),
                HighlightCard(entry: state.mostPositiveEntry),
                Card(
                  child: ListTile(
                    title: const Text('Total Steps'),
                    subtitle: Text('${state.totalSteps}'),
                  ),
                ),
              ],
            );
          } else if (state is DashboardError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
