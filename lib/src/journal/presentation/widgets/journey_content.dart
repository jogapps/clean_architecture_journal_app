import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/core/common/extensions/context_extension.dart';
import 'package:journal_app/core/common/widgets/app_elevated_button.dart';
import 'package:journal_app/core/res/asset_images.dart';
import 'package:journal_app/core/routes/app_routes.dart';
import 'package:journal_app/core/theme/colors.dart';
import 'package:journal_app/core/theme/theme_style.dart';
import 'package:journal_app/src/journal/presentation/cubit/journal_cubit.dart';
import 'package:lottie/lottie.dart';

class JournalContent extends StatefulWidget {
  const JournalContent({
    required this.motivationalMessage,
    required this.steps,
    super.key,
  });
  final String motivationalMessage;
  final int steps;

  @override
  State<JournalContent> createState() => _JournalContentState();
}

class _JournalContentState extends State<JournalContent> {
  String _selectedMood = '😀';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.motivationalMessage,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${widget.steps} steps today',
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: PADDING_LG * 0.85, vertical: PADDING_LG),
            labelText: 'Write your thoughts here...',
            labelStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: KColors.textLight),
            hintText: 'Start typing...',
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        Text(
          'How are you feeling today?',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMoodButton('😀', 'Happy'),
            _buildMoodButton('😐', 'Neutral'),
            _buildMoodButton('😢', 'Sad'),
            _buildMoodButton('😡', 'Angry'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Journal Entries',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<JournalCubit, JournalState>(
            builder: (context, state) {
              if (state is JournalLoaded) {
                final entries = state.entries;
                if (entries.isEmpty) {
                  return const Center(
                    child: Text(
                      'No journal entries yet.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return ListTile(
                      title: Text(
                        entry.content,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      subtitle: Text(
                        'Mood: ${entry.mood}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.red, size: 36),
                        onPressed: () {
                          context.read<JournalCubit>().deleteEntry(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Journal entry deleted!')),
                          );
                        },
                      ),
                    );
                  },
                );
              } else if (state is JournalLoading) {
                return Center(child: Lottie.asset(AssetImages.loading));
              } else {
                return const Center(child: Text('Failed to load entries.'));
              }
            },
          ),
        ),
        const SizedBox(height: PADDING_LG),
        AppElevatedButton(
            text: 'Save Entry',
            onPressed: () {
              context
                  .read<JournalCubit>()
                  .saveEntry(_controller.text, _selectedMood);
              context.scaffoldMessenger.showSnackBar(
                const SnackBar(content: Text('Journal entry saved!')),
              );
            }),
        const SizedBox(height: PADDING),
        AppElevatedButton(
          text: 'Go to Dashboard',
          onPressed: () => context.navigator.pushNamed(AppRoutes.dashboard),
        ),
        const SizedBox(height: PADDING),
      ],
    );
  }

  Widget _buildMoodButton(String emoji, String label) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedMood = emoji;
            });
          },
          icon: _selectedMood == emoji
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(PADDING_SM),
                    child: Text(
                      emoji,
                      style: TextStyle(
                        fontSize: 28,
                        color:
                            _selectedMood == emoji ? Colors.teal : Colors.black,
                      ),
                    ),
                  ),
                )
              : Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 28,
                    color: _selectedMood == emoji ? Colors.teal : Colors.black,
                  ),
                ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
