//external packages
import 'package:eldtech_sos/permissions.dart';
import 'package:eldtech_sos/spokenLang/spokenLangBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//local packages

import '../reusable/customLayout.dart';
import'/reusable/buttons.dart';
import'/reusable/text.dart';
import '../route.dart';
import '../appLang/appLocale.dart' show tr;
class spokenLang extends StatelessWidget {
  spokenLang({Key? key}) : super(key: key);
  List<String>selectedLang=[];
  List<String>unSelectedLang=[];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<spokenLangBloc,spokenLangState>(


    builder:(context,state) {
        print('build');
        if (state is updatedSpokenLang){
          selectedLang=state.selectedLang;
          print('UI'+selectedLang.toString());
          unSelectedLang=state.unselectedLang;
          print('UI'+unSelectedLang.toString());
        }
        return columnLayoutWithGradientBackground([
          Align(child: backButton(),alignment: Alignment.topLeft,),
          header(text:tr(context).addSpokenLanguage),
          SizedBox( //display selected lang
            width:300,
            height:300,
            child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: selectedLang.length,
            itemBuilder: (BuildContext context, int index) {
            return Container(
            height: 50,
            color: Colors.blue,
            child: Row(children: [
              Text(selectedLang[index]),
              Material(
                child: IconButton( icon: Icon(Icons.cancel_outlined),
                onPressed:(){context.read<spokenLangBloc>().add(deleteSpokenLang(selectedLang[index]));},
                ),
              )

            ]),
            );
            },

            ),
          ),
          ElevatedButton(  //plus button
            child: Icon(Icons.add, color: Colors.blue,),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>AlertDialog(

                    content:
                      SizedBox( //dialog box content region
                        height: 300.0,
                        width: 300.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: unSelectedLang.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(//blue border of button
                              height: 50,
                              color: Colors.blue,
                              child: roundRectButton(color:Colors.orange, text:unSelectedLang[index],
                                  func: (){
                                    context.read<spokenLangBloc>().add(addSpokenLang(unSelectedLang[index]));
                                    Navigator.pop(context);}
                              ),
                            );
                          },

                        ),
                      ),

                  )
              );
            },

          ),
          roundRectButton(color:Colors.orange,text:"Next",
              func: (){
                context.read<spokenLangBloc>().add(submitSpokenLang());
                Navigator.pushNamed(context,roleRoute);}
          ),
        ]);
      });
  }
}
















