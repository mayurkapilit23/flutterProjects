import 'package:equatable/equatable.dart';

abstract class RandomJokesEvents extends Equatable {
  const RandomJokesEvents();

  List<Object?> get props => [];
}

class FetchRandomJokesEvent extends RandomJokesEvents {}
