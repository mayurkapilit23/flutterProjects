import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/modules/login/bloc/login_event.dart';
import 'package:login_register_app/modules/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool _isObscure = true;

  LoginBloc() : super(LoginInitialState()) {
    //loginSubmit event

    on<LoginSubmitEvent>(_onLoginSubmitEvent);

    on<ObscureButtonEvent>(_onObscureButtonState);
  }

  Future<void> _onLoginSubmitEvent(event, emit) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    if (event.email == 'user' && event.password == 'user') {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState('Invalid input'));
    }
  }

  void _onObscureButtonState(event, emit) {
    _isObscure = !_isObscure;
    emit(ObscureButtonState(isObscure: _isObscure));
  }
}
