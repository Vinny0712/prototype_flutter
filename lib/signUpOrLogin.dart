//external

import 'package:flutter/material.dart';

//local
import'/reusable/buttons.dart';
import'/reusable/text.dart';
import 'package:eldtech_sos/reusable/customLayout.dart';
import 'route.dart';
import'appLang/appLocale.dart' show tr;

//page widget
class signUpOrLogin extends StatelessWidget {
  const signUpOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return columnLayoutWithGradientBackground([
//tr(context).welcomeDescription
        header(text:tr(context).welcomeToSos),
        paragraph(text:tr(context).welcomeDescription),
        Image.asset('images/SOS_logo_2.png',fit: BoxFit.fitWidth,),
        roundRectButton(color:Colors.blue,text:tr(context).register,
            func: (){
              Navigator.pushNamed(context,appLocaleRoute);
            }
          ),
        roundRectButton(text:tr(context).logIn,func: (){print('hi');}),

      ],
    );

  }
}

