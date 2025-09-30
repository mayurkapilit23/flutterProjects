import 'dart:convert';

import 'package:api_call_with_bloc/bloc/random_jokes_event.dart';
import 'package:api_call_with_bloc/bloc/random_jokes_state.dart';
import 'package:api_call_with_bloc/repository/randomJokes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/randomJokesModel.dart';

class RandomJokesBloc extends Bloc<RandomJokesEvents, RandomJokesState> {
  RandomJokes staticJoke = RandomJokes(type: "programming", setup: "What do you call a computer mouse that swears a lot?, punchline: A cursor!", id: 435, punchline: '', error: '');
  final RandomJokesRepository randomJokesRepository;

  RandomJokesBloc(this.randomJokesRepository) : super(RandomJokesInitial()) {
    on<FetchRandomJokesEvent>((event, emit) async {
      emit(RandomJokesLoading());
      try {
        final randomJokes = await randomJokesRepository.fetchRandomJokes();
        // emit(RandomJokesLoaded(randomJokes));

        emit(RandomJokesLoaded(staticJoke));

        // emit(RandomJokesLoading());
      } catch (e) {
        emit(RandomJokesError(e.toString()));
      }
    });
  }
}
