import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:journal_app/core/services/hive_setup.dart';
import 'package:journal_app/core/utils/constants.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_mood_trends.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_most_positive_entry.dart';
import 'package:journal_app/src/dashboard/domain/usecases/fetch_total_steps.dart';
import 'package:journal_app/src/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:journal_app/src/journal/data/datasources/health_metrics_remote_data_source.dart';
import 'package:journal_app/src/journal/data/datasources/journal_local_data_source.dart';
import 'package:journal_app/src/journal/data/models/journal_entry_model.dart';
import 'package:journal_app/src/journal/data/repositories/journal_repository_impl.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';
import 'package:journal_app/src/journal/domain/usecases/delete_journal_entry.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_health_metrics.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_journal_entries.dart';
import 'package:journal_app/src/journal/domain/usecases/save_journal_entry.dart';
import 'package:journal_app/src/journal/presentation/cubit/journal_cubit.dart';
import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/data/repositories/motivational_message_repository_impl.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:journal_app/src/splash/presentation/cubit/splash_cubit.dart';

final sl = GetIt.instance; // Service Locator instance

Future<void> init() async {
  await HiveSetup.init();

  // **Core**
  sl
    ..registerLazySingleton(Dio.new)

    // **Cubit/Bloc**
    ..registerFactory(SplashCubit.new)
    ..registerFactory(
      () => OnBoardingCubit(sl()),
    ) // Pass FetchMotivationalMessage use case
    ..registerFactory(() => JournalCubit(
          fetchMotivationalMessage: sl(),
          fetchHealthMetrics: sl(),
          saveJournalEntry: sl(),
          fetchJournalEntries: sl(),
          deleteJournalEntry: sl(),
        ))
    ..registerFactory(() => DashboardCubit(
          fetchMoodTrends: sl(),
          fetchMostPositiveEntry: sl(),
          fetchTotalSteps: sl(),
        ))

    // **Use Cases**
    ..registerLazySingleton(
      () => FetchMotivationalMessage(sl()),
    )
    ..registerLazySingleton(() => FetchHealthMetrics(sl()))
    ..registerLazySingleton(() => SaveJournalEntry(sl()))
    ..registerLazySingleton(() => FetchJournalEntries(sl()))
    ..registerLazySingleton(() => DeleteJournalEntry(sl()))
    ..registerLazySingleton(() => FetchMoodTrends(sl()))
    ..registerLazySingleton(() => FetchMostPositiveEntry(sl()))
    ..registerLazySingleton(() => FetchTotalSteps(sl())) // Pass repository

    // **Repositories**
    ..registerLazySingleton<MotivationalMessageRepository>(
      () => MotivationalMessageRepositoryImpl(sl()), // Pass data source
    )
    ..registerLazySingleton<JournalRepository>(() => JournalRepositoryImpl(
          motivationalMessageRemoteDataSource: sl(),
          healthMetricsRemoteDataSource: sl(),
          journalLocalDataSource: sl(),
        ))

    // **Data Sources**
    ..registerLazySingleton<MotivationalMessageDataSource>(
      () => MotivationalMessageDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => HealthMetricsRemoteDataSource(sl()))
    ..registerLazySingleton(
      () => JournalLocalDataSource(
        Hive.box<JournalEntryModel>(
            Constants.journalBox), // Provide explicit type
      ),
    );
}
