import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/data/repositories/motivational_message_repository_impl.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:journal_app/src/splash/presentation/cubit/splash_cubit.dart';

final sl = GetIt.instance; // Service Locator instance

Future<void> init() async {
  // **Cubit/Bloc**
  sl
    ..registerFactory(
      () => OnBoardingCubit(sl()),
    ) // Pass FetchMotivationalMessage use case
    ..registerFactory(
      SplashCubit.new,
    )
    // **Use Cases**
    ..registerLazySingleton(
      () => FetchMotivationalMessage(sl()),
    ) // Pass repository

    // **Repositories**
    ..registerLazySingleton<MotivationalMessageRepository>(
      () => MotivationalMessageRepositoryImpl(sl()), // Pass data source
    )

    // **Data Sources**
    ..registerLazySingleton<MotivationalMessageDataSource>(
      () => MotivationalMessageDataSourceImpl(sl()), // Pass Dio instance
    )

    // **Core**
    ..registerLazySingleton(Dio.new); // Register Dio for HTTP requests
}
