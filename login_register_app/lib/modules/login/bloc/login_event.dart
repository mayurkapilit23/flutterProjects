import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginSubmitEvent extends LoginEvent {
  String? email;
  String? password;

  LoginSubmitEvent({this.email, this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class ObscureButtonEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
