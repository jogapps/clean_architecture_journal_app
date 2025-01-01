import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> loadingSplash() async {
    emit(const SplashLoading());
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(const SplashLoaded());
  }
}
