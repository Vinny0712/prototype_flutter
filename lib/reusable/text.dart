import 'package:flutter/material.dart';


class header extends StatelessWidget {
  final String text;
  const header({Key? key,this.text=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:300,
        child:Text(this.text,
            textScaleFactor: 0.8,
            textAlign: TextAlign.center,
            style:TextStyle(color: Colors.black))
    );
  }
}


class paragraph extends StatelessWidget {
  final String text;
  const paragraph({Key? key,this.text=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:300,
        child:Text(this.text,
            textScaleFactor: 0.3,
            textAlign: TextAlign.center,
            style:TextStyle(color: Colors.black))
    );
  }
}


