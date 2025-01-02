import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_mood_trends.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_most_positive_entry.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_total_steps.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.fetchMoodTrends,
    required this.fetchMostPositiveEntry,
    required this.fetchTotalSteps,
  }) : super(DashboardInitial());
  // DashboardCubit() : super(DashboardInitial());

  final FetchMoodTrends fetchMoodTrends;
  final FetchMostPositiveEntry fetchMostPositiveEntry;
  final FetchTotalSteps fetchTotalSteps;

  Future<void> loadDashboardData() async {
    emit(DashboardLoading());

    try {
      final moodTrendsResult = await fetchMoodTrends();
      final mostPositiveResult = await fetchMostPositiveEntry();
      final totalStepsResult = await fetchTotalSteps();

      moodTrendsResult.fold(
        (error) => emit(DashboardError(error)),
        (moodTrends) {
          mostPositiveResult.fold(
            (error) => emit(DashboardError(error)),
            (mostPositive) {
              totalStepsResult.fold(
                (error) => emit(DashboardError(error)),
                (totalSteps) {
                  emit(DashboardLoaded(
                    moodTrends: moodTrends,
                    mostPositiveEntry: mostPositive,
                    totalSteps: totalSteps,
                  ));
                },
              );
            },
          );
        },
      );
    } catch (e) {
      emit(const DashboardError('Failed to load dashboard data'));
    }
  }
}
