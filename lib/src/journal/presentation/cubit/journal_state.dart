part of 'journal_cubit.dart';

sealed class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}

final class JournalInitial extends JournalState {}

class JournalLoading extends JournalState {}

class JournalLoaded extends JournalState {
  const JournalLoaded({
    required this.message,
    required this.metrics,
    required this.entries,
  });

  final MotivationalMessage message;
  final HealthMetrics metrics;
  final List<JournalEntry> entries;

  JournalLoaded copyWith({
    MotivationalMessage? message,
    HealthMetrics? metrics,
    List<JournalEntry>? entries,
  }) {
    return JournalLoaded(
      message: message ?? this.message,
      metrics: metrics ?? this.metrics,
      entries: entries ?? this.entries,
    );
  }

  @override
  List<Object> get props => [message, metrics, entries];
}

class JournalError extends JournalState {
  const JournalError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
