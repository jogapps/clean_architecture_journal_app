import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/src/journal/presentation/cubit/journal_cubit.dart';
import 'package:journal_app/src/journal/presentation/widgets/journey_content.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Journal Entry'),
        centerTitle: true,
      ),
      body: BlocBuilder<JournalCubit, JournalState>(
        builder: (context, state) {
          if (state is JournalLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JournalError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is JournalLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: JournalContent(
                motivationalMessage: state.message.message,
                steps: state.metrics.steps,
              ),
            );
          } else {
            return const Center(child: Text('Welcome to Journaling!'));
          }
        },
      ),
    );
  }
}
