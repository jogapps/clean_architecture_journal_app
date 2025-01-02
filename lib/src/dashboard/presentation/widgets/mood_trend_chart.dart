import 'package:flutter/material.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoodTrendChart extends StatelessWidget {
  const MoodTrendChart({required this.moodTrends, super.key});

  final List<JournalEntry> moodTrends;

  @override
  Widget build(BuildContext context) {
    final data = moodTrends
        .map((entry) => _MoodTrendData(
              entry.date,
              _moodToNumeric(entry.mood),
            ))
        .toList();

    debugPrint('data ${data.first.mood.toString()}');

    return SfCartesianChart(
      title: const ChartTitle(text: 'Mood Trends'),
      primaryXAxis: const DateTimeAxis(),
      primaryYAxis: const NumericAxis(
        minimum: 0,
        maximum: 10,
        interval: 1,
      ),
      series: <LineSeries<_MoodTrendData, DateTime>>[
        LineSeries<_MoodTrendData, DateTime>(
          color: Colors.pink,
          dataSource: data,
          xValueMapper: (_MoodTrendData data, _) => data.date,
          yValueMapper: (_MoodTrendData data, _) => data.mood,
        ),
      ],
    );
  }

  int _moodToNumeric(String mood) {
    debugPrint('mood $mood');
    switch (mood.toLowerCase()) {
      case 'happy':
      case '😀':
        return 8;
      case 'neutral':
      case '😐':
        return 5;
      case 'sad':
      case '😢':
        return 2;
      case '😡':
      default:
        return 0;
    }
  }
}

class _MoodTrendData {
  _MoodTrendData(this.date, this.mood);
  final DateTime date;
  final int mood;
}
