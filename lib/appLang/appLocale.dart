//external packages
import 'package:eldtech_sos/reusable/customLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import'package:flutter_bloc/flutter_bloc.dart';

//local packages

import'/reusable/buttons.dart';
import'/reusable/text.dart';
import '../route.dart';
import'package:eldtech_sos/appLang/appLangBloc&Event&State.dart';
import'package:eldtech_sos/userRepo.dart';


const List<String> appLangButtonTextLabel = [
  'English',
  '中文',
  'melayu',
  'தமிழ்',
];
const List<String> kAppLocale = [
  'en',
  'zh',
  'ms',
  'ta',
];
 List<appLangEvent> appLangEvents=[
  setEN(),setZH(),setMS(),setTA()
];

//methods
AppLocalizations tr(context) {
  AppLocalizations localise = AppLocalizations.of(context)!;
  return localise;
}

class appLocale extends StatelessWidget {
  const appLocale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<appLangBloc,String>(
      builder:(context,langCode){
        return columnLayoutWithGradientBackground(
            [
              Align(child: backButton(),alignment: Alignment.topLeft,),
              header(text:tr(context).confirmAppLanguage),
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
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:EdgeInsets.all(10),
                          child: SizedBox(
                            height:50,
                            width:double.infinity ,
                            child: BlocBuilder<appLangBloc,String>(
                              builder:(context,langCode) {
                                return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:langCode==kAppLocale[index] ? Colors.white : Colors.orange,
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: (){
                                  context.read<appLangBloc>().add(appLangEvents[index]);

                                },
                                child:Text(appLangButtonTextLabel[index],style:TextStyle(fontSize:20,color: Colors.black)),

                              );}
                            ),
                          ),
                        );
                      },
                      itemCount: appLangButtonTextLabel.length,
                    ),
                  )
              ),
              roundRectButton(color:Colors.orange,text:"Next",
                  func: (){
                try{
                    userRepo.setInitialAppLang(langCode);
                    Navigator.pushNamed(context,spokenLangRoute);
                }catch(e){
                  print(e.toString());
                }



                  }
              ),
            ]
        );
      }
      );


  }
}




