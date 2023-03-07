import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../reusable/buttons.dart';
import '../../reusable/customLayout.dart';
import '../../reusable/text.dart';
import '../../route.dart';
import'package:flutter_bloc/flutter_bloc.dart';
import'../signUpState.dart';
import'../signUpEvent.dart';
import'../signUpBloc.dart';

class smsPinSignUp extends StatelessWidget {
  const smsPinSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:BlocProvider.of<signUpBloc>(context),
      child: BlocConsumer<signUpBloc, signUpState>(
        listener:(context,state){
          if (state is pinCorrect){
            Navigator.pushNamed(context,roleRoute);
          }
          else if (state is pinError){
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
        builder: (context,state){
          return columnLayoutWithGradientBackground([
            paragraph(text:'please key in 6 digit code sent to your mobile number '),
            Material(
              child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (text){
                    context.read<signUpBloc>().add(inputPin(text));
                  }
              ),
            ),
            roundRectButton(color:Colors.orange,text:"Next",
                func: (){
                  context.read<signUpBloc>().add(submitPin());
                }

            ),
        ]);
          },
      ),
    );
  }
}
