import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/config/app_colors.dart';
import 'package:login_register_app/modules/home/home_screen.dart';
import 'package:login_register_app/modules/login/bloc/login_bloc.dart';
import 'package:login_register_app/modules/login/bloc/login_event.dart';
import 'package:login_register_app/modules/login/bloc/login_state.dart';
import 'package:login_register_app/widgets/custom_button.dart';
import 'package:login_register_app/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  void _onLoginPressed(BuildContext context) {
    final email = emailEditingController.text.toString().trim();
    final password = passwordEditingController.text.toString().trim();

    context.read<LoginBloc>().add(
      LoginSubmitEvent(email: email, password: password),
    );
  }

  void _onObscureButtonPressed(BuildContext context) {
    bool obscure = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              spacing: 20,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),

                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    CustomTextField(
                      controller: emailEditingController,
                      hint: 'leo88@gmail',
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    CustomTextField(
                      obscureText: state is ObscureButtonState
                          ? state.isObscure
                          : true,
                      controller: passwordEditingController,
                      hint: '************',
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(ObscureButtonEvent());
                        },
                        icon: state is ObscureButtonState && !state.isObscure
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("forgot password");
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                state is LoginLoadingState
                    ? CircularProgressIndicator()
                    : GradientButton(
                        text: "Sign in",
                        onPressed: () => _onLoginPressed(context),
                      ),
              ],
            );
          },
          listener: (context, state) {
            if (state is LoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Successfully")),
              );

              final emailText = emailEditingController.text.trim();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(email: emailText),
                ),
              );
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
      ),
    );
  }
}
