//external
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//local
import 'roleBloc&Event&State.dart';
import'/reusable/buttons.dart';
import'/reusable/text.dart';
import'/reusable/customLayout.dart';
import '../route.dart';
import'../appLang/appLocale.dart' show tr;
import 'package:eldtech_sos/userRepo.dart';


class role extends StatelessWidget {
  const role({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>roleBloc(),
        child: BlocBuilder<roleBloc,String>(
        builder: (context,role){
      return columnLayoutWithGradientBackground(
      [
        Align(child: backButton(),alignment: Alignment.topLeft,),
        header(text:tr(context).hereTo),
        SizedBox(
          width:350,
          height:350,
          child:
          Container(
            decoration:BoxDecoration(
              color:Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child:  Row(
                  children: [
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: role=='volunteer'? Colors.white : Colors.orange,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: (){
                      context.read<roleBloc>().add(setRoleVolunteer());

                    },
                    child:Text(tr(context).volunteer,style:TextStyle(fontSize:20,color: Colors.black))),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: role=='elderly'? Colors.white : Colors.orange,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                    onPressed: (){
                      context.read<roleBloc>().add(setRoleElderly());
                      },
                    child:Text(tr(context).seekHelp,style:TextStyle(fontSize:20,color: Colors.black))),

                  ],
                )
          )
        ),
        roundRectButton(color:Colors.orange,text:"Next",
        func: (){
          userRepo.setInitialRole(role);
          Navigator.pushNamed(context,signUpPgRoute);
        }
        ),



      ],
    );//wrap here
  }
  ));
}}







