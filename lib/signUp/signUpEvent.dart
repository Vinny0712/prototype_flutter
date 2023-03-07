import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class signUpEvent extends Equatable{

}

class inputName extends signUpEvent{

  String name;

  inputName(this.name);
  @override
  List<Object> get props => [];
}
class inputPhone extends signUpEvent{

  String phone;

  inputPhone(this.phone);
  @override
  List<Object> get props => [];
}
class inputPassword extends signUpEvent{

  String password;

  inputPassword(this.password);
  @override
  List<Object> get props => [];
}
class verifyCredentials extends signUpEvent{
  @override
  List<Object> get props => [];
}
class verifyPhone extends signUpEvent{
  BuildContext context;
  verifyPhone(this.context);
  @override
  List<Object> get props => [];
}
/*class verifyPhone extends signUpEvent{
  String phone;
  String password;
  verifyPhone(this.phone,this.password);
  @override
  List<Object> get props => [phone,password];
}*/

class inputPin extends signUpEvent{
  String pin;
  inputPin(this.pin);
  @override
  List<Object> get props => [];
}

class submitPin extends signUpEvent{



  @override
  List<Object> get props => [];
}

class phoneVerificationComplete extends signUpEvent{

phoneVerificationComplete();



  @override
  List<Object> get props => [];
}
class phoneVerificationFailed extends signUpEvent{
  FirebaseAuthException e;
  phoneVerificationFailed(this.e);



  @override
  List<Object> get props => [];
}
class smsCodeSent extends signUpEvent{

  smsCodeSent();



  @override
  List<Object> get props => [];
}

