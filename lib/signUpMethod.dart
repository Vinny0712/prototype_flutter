import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//local

import'/reusable/buttons.dart';
import'/reusable/text.dart';
import'/reusable/customLayout.dart';
import '../route.dart';



class signUpMethod extends StatelessWidget {
  const signUpMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return columnLayoutWithGradientBackground(
      [

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
                                primary: Colors.orange,
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context,signUpPgRoute);

                              },
                              child:Text("OTP",style:TextStyle(fontSize:20,color: Colors.black))),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:  Colors.orange,
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                              onPressed: (){

                              },
                              child:Text("SINGPASS",style:TextStyle(fontSize:20,color: Colors.black))),

                        ],
                      )
                  )
              ),





            ],
          );//wrap here //
       }
}