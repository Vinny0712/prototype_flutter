
import 'package:equatable/equatable.dart';

abstract class signUpState extends Equatable{}

//applicable in sign up form page
class startSignUp extends signUpState{
  @override
  List<Object?> get props => [];
}
class credentialInvalid extends signUpState{
  String nameError;
  String phoneError;
  String passwordError;
  credentialInvalid(this.nameError,this.phoneError,this.passwordError);
  @override
  List<Object?> get props => [nameError,phoneError,passwordError];
}
class nameInvalid extends signUpState{
  String error;
  nameInvalid(this.error);
  @override
  List<Object?> get props => [];
}
class phoneInvalid extends signUpState{
  String error;
  phoneInvalid(this.error);
  @override
  List<Object?> get props => [];
}
class passwordInvalid extends signUpState{
  String error;
  passwordInvalid(this.error);
  @override
  List<Object?> get props => [];
}
class phoneVerified extends signUpState{
  @override
  List<Object?> get props => [];
}


class fireBaseError extends signUpState{
  String errorMsg;
  fireBaseError(this.errorMsg);
  @override
  List<Object?> get props => [];

}


class checkPin extends signUpState{
  @override
  List<Object?> get props => [];
}
//applicable in pin page


class pinCorrect extends signUpState{
  @override
  List<Object?> get props => [];
}
class pinError extends signUpState{
  String errorMsg;
  pinError(this.errorMsg);
  @override
  List<Object?> get props => [];

}