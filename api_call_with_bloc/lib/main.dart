import 'package:api_call_with_bloc/bloc/random_jokes_bloc.dart';
import 'package:api_call_with_bloc/bloc/random_jokes_event.dart';
import 'package:api_call_with_bloc/bloc/random_jokes_state.dart';
import 'package:api_call_with_bloc/model/randomJokesModel.dart';
import 'package:api_call_with_bloc/repository/randomJokes_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RandomJokesRepository randomJokesRepository = RandomJokesRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) =>
            RandomJokesBloc(randomJokesRepository)
              ..add(FetchRandomJokesEvent()),
        child: RandomJokesPage(),
      ),
    );
  }
}

class RandomJokesPage extends StatelessWidget {
  const RandomJokesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RandomJokesBloc, RandomJokesState>(
        builder: (context, state) {
          print("BLOC Builder : state  : ${state.toString()}");
          if (state is RandomJokesInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RandomJokesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RandomJokesLoaded) {
            // print("BLOC Builder RandomJokesLoaded");
            final RandomJokes randomJokes = state.randomJokes;
            print(randomJokes.hashCode);
            return _RandomJokesCard(context, randomJokes);
          } else if (state is RandomJokesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

Widget _RandomJokesCard(BuildContext context, RandomJokes randomJokes) {
  return Padding(
    padding: EdgeInsetsGeometry.all(10),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tileColor: Colors.deepPurpleAccent,
            title: RichText(
              text: TextSpan(
                text: 'Joke: ',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '${randomJokes.setup}',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: 'Answer: ',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '${randomJokes.punchline}',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // RichText(
          //   text: TextSpan(
          //     text: 'Joke Type: ',
          //     style: GoogleFonts.poppins(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: '${randomJokes.type}',
          //         style: GoogleFonts.poppins(
          //           fontSize: 20,
          //           fontWeight: FontWeight.normal,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          OutlinedButton(
            onPressed: () {
              context.read<RandomJokesBloc>().add(FetchRandomJokesEvent());
            },
            child: Text(
              "Get a New Joke",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
