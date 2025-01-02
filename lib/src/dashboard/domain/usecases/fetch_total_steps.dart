import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class FetchTotalSteps {
  FetchTotalSteps(this.repository);
  final JournalRepository repository;

  Future<Either<String, int>> call() async {
    try {
      final result = await repository.fetchHealthMetrics();
      return Right(result.steps);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
