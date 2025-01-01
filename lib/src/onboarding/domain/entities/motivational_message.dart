import 'package:equatable/equatable.dart';

class MotivationalMessage extends Equatable {
  MotivationalMessage({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
