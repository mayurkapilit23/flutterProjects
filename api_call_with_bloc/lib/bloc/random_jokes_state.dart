import 'package:api_call_with_bloc/model/randomJokesModel.dart';
import 'package:equatable/equatable.dart';

abstract class RandomJokesState extends Equatable {
  // const RandomJokesState();
  //
  // @override
  // List<Object?> get props => [];
}

class RandomJokesInitial extends RandomJokesState {
  @override
  List<Object?> get props => [];
}

class RandomJokesLoading extends RandomJokesState {
  @override
  List<Object?> get props => [];
}

class RandomJokesLoaded extends RandomJokesState {
  final RandomJokes randomJokes;

  RandomJokesLoaded(this.randomJokes);

  @override
  List<Object?> get props => [];
}

class RandomJokesError extends RandomJokesState {
  final String message;

  RandomJokesError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
