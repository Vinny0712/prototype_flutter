
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signUpEvent.dart';
import 'signUpState.dart';
import 'package:eldtech_sos/userRepo.dart';

class signUpBloc extends Bloc <signUpEvent,signUpState>{

  String _name='';
  String _phone='';
  String _password='';
  String _pin='';
  String _verificationId='';
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;


  String nameValidator(String name){
    print('name validator called'+_name);
    if (name.length<=1){

      print('name length less than 1');
      return 'name too short';
    }
    return '';
  }
  String phoneValidator(String phone){
    print('phone validator called'+_phone);
    if (phone.length!=8){
      print('phone not 8 digits');
      return '8 digit phone number required!';
    }
    return '';
  }
  String passwordValidator(String password){
    print('pw validator called'+_password);
    if (password.length<8){
      return 'password must be at least 8 characters!';
    }
    return '';
  }

  signUpBloc():super(startSignUp()){

    on<inputName>((event,emit){
      print('typing name');
      _name=event.name;
    }

    );

    on<inputPhone>((event,emit){
      print('typing phone');
      _phone=event.phone;
      print(_phone);
    }

    );

    on<inputPassword>((event,emit){
      print('typing password');
      _password=event.password;
      print(_password);
    }

    );

    on<phoneVerificationComplete>((event,emit){
      emit(phoneVerified());

    });
    on<phoneVerificationFailed>((event,emit){
      emit(fireBaseError(event.e.code));
    });

    on<smsCodeSent>((event,emit){
      emit(checkPin());
    });

    on<verifyPhone>((event,emit) async {
    String nameError=nameValidator(_name);
    String phoneError=phoneValidator(_phone);
    String passwordError=passwordValidator(_password);




    if (nameError==''&&phoneError==''&&passwordError==''){
      try{
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+65'+_phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            //log in user n emit verifyPhone
            await _firebaseAuth.signInWithCredential(credential).then((user) {
              if (user.user != null) {
                try{
                add(phoneVerificationComplete());

                }
                catch(e){
                  print(e.toString());
                }
              }
            });

          },
          verificationFailed: (FirebaseAuthException e) {
            add(phoneVerificationFailed(e));

          },
          codeSent: (String verificationId, int? resendToken) {
            _verificationId=verificationId;
            add(smsCodeSent());


          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }catch(e){
        print(e.toString());
      }



    }

    else{
      print('Error'+nameError);
      print('Error'+phoneError);
      print('Error'+passwordError);
      emit(credentialInvalid(nameError, phoneError, passwordError));

    }
    });

    on<inputPin>((event,emit){
      _pin=event.pin;

    });

    on<submitPin>((event,emit) async{
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:_verificationId,smsCode:_pin);
        await _firebaseAuth.signInWithCredential(credential).then((userCredential) {
          userRepo.setUid(userCredential.user?.uid);

        });
        userRepo.setInitialName(_name);
        userRepo.setInitialPassword(_password);
        userRepo.setInitialPhone(_phone);
        userRepo.createUser();

        emit(phoneVerified());
        //initialize user in firebase with app/spokenLang,role,phone,name,pw
      } catch(e){
        emit(fireBaseError(e.toString()));
      }


    });

  }

}




