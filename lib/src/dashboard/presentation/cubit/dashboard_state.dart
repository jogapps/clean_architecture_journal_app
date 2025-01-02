part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  const DashboardLoaded({
    required this.moodTrends,
    required this.mostPositiveEntry,
    required this.totalSteps,
  });

  final List<JournalEntry> moodTrends;
  final JournalEntry mostPositiveEntry;
  final int totalSteps;

  @override
  List<Object> get props => [moodTrends, mostPositiveEntry, totalSteps];
}

class DashboardError extends DashboardState {
  const DashboardError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
