//external packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//local packages

import'/reusable/buttons.dart';
import'/reusable/text.dart';
import'/reusable/customLayout.dart';
import '../../route.dart';
import '../../appLang/appLocale.dart' show tr;
import 'package:eldtech_sos/signUp/signUpBloc.dart';
import 'package:eldtech_sos/signUp/signUpEvent.dart';
import 'package:eldtech_sos/signUp/signUpState.dart';

class signUpPg extends StatelessWidget {
  const signUpPg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<signUpBloc, signUpState>(

        listener: (context, state) {
          if (state is checkPin){
            Navigator.of(context).pushNamed(smsPinSignUpRoute);
          }
          else if(state is phoneVerified){
            Navigator.pushNamed(context,permissionsRoute);
          }
          else if(state is fireBaseError){
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Firebase Error'),
                content: Text(state.errorMsg),
                actions: <Widget>[

                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder:(context,state) {
          return columnLayoutWithGradientBackground(
          [
          Align(child: backButton(),alignment: Alignment.topLeft,),
          header(text:tr(context).fillInDetails),
          SizedBox(
          width:300,
          height:300,
          child:
          Container(
          padding:EdgeInsets.symmetric(horizontal:10),
          decoration:BoxDecoration(
          color:Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)
          )),
          child: Material(
          child: Form(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextFormField(
          decoration: InputDecoration(
          labelText: 'name',
          errorText: state is credentialInvalid && state.nameError!=''
          ? state.nameError
              : null,
          ),
          onChanged: (text) {
          context.read<signUpBloc>().add(inputName(text));
          }),
          TextFormField(
          decoration: InputDecoration(
          labelText: 'phone',
          errorText: state is credentialInvalid && state.phoneError!=''
          ? state.phoneError
              : null,
          ),
          onChanged: (text) {
          context.read<signUpBloc>().add(inputPhone(text));
          }),
          TextFormField(
          decoration: InputDecoration(
          labelText: 'password',
          errorText: state is credentialInvalid &&state.passwordError!=''
          ? state.passwordError
              : null,
          ),
          onChanged: (text) {
          context.read<signUpBloc>().add(inputPassword(text));
          }),
          ElevatedButton(
          onPressed: () {
          context.read<signUpBloc>().add(verifyPhone(context));
          },
          child: Text('next'))
          ],
          )),
          )


          )
          ),



          ],
          )
        ;}
    );
  }
}


