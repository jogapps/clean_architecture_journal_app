import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/src/journal/domain/entities/health_metrics.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/usecases/delete_journal_entry.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_health_metrics.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_journal_entries.dart';
import 'package:journal_app/src/journal/domain/usecases/save_journal_entry.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';

part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit({
    required this.fetchMotivationalMessage,
    required this.fetchHealthMetrics,
    required this.saveJournalEntry,
    required this.fetchJournalEntries,
    required this.deleteJournalEntry,
  }) : super(JournalInitial());

  final FetchMotivationalMessage fetchMotivationalMessage;
  final FetchHealthMetrics fetchHealthMetrics;
  final SaveJournalEntry saveJournalEntry;
  final FetchJournalEntries fetchJournalEntries;
  final DeleteJournalEntry deleteJournalEntry;

  Future<void> loadInitialData() async {
    emit(JournalLoading());
    try {
      final message = await fetchMotivationalMessage();
      final metrics = await fetchHealthMetrics();
      final entries = await fetchJournalEntries();
      debugPrint('entries ${entries.toString()}');

      entries.fold((errorMessage) {
        // Handle the error (optional)
        emit(const JournalError('Failed to fetch journal entries'));
      }, (updatedEntries) {
        // Emit the updated state with new entries
        emit(JournalLoaded(
          message: message,
          metrics: metrics,
          entries: updatedEntries,
        ));
      });
    } catch (e) {
      emit(JournalError('Failed to load data: $e'));
    }
  }

  Future<void> saveEntry(String content, String mood) async {
    final entry = JournalEntry(
      content: content,
      mood: mood,
      date: DateTime.now(),
    );
    await saveJournalEntry(entry);
    final entries = await fetchJournalEntries();
    debugPrint('entries ${entries.toString()}');
    entries.fold((errorMessage) {
      // Handle the error (optional)
      emit(const JournalError('Failed to fetch journal entries'));
    }, (updatedEntries) {
      // Emit the updated state with new entries
      debugPrint('updatedEntries ${updatedEntries}');
      final currentState = state;
      if (currentState is JournalLoaded) {
        emit(currentState.copyWith(entries: updatedEntries));
      }
    });
  }

  Future<void> deleteEntry(int index) async {
    emit(JournalLoading());

    // Call the repository method to delete the entry
    final result = await deleteJournalEntry(index);

    result.fold(
      (errorMessage) => emit(JournalError(errorMessage)),
      (_) async {
        // After deletion, fetch updated entries
        final entriesResult = await fetchJournalEntries();

        await entriesResult.fold(
          (errorMessage) {
            // If there is an error fetching entries, show error state
            emit(JournalError(errorMessage));
          },
          (updatedEntries) async {
            // Emit the updated state with new entries
            if (state is JournalLoaded) {
              final currentState = state as JournalLoaded;
              emit(JournalLoaded(
                message: currentState.message,
                metrics: currentState.metrics,
                entries: updatedEntries,
              ));
            } else {
              // If the state is not JournalLoaded, emit JournalLoaded without message and metrics
              await loadInitialData();
            }
          },
        );
      },
    );
  }
}
