import 'package:flutter/material.dart';
import 'package:eldtech_sos/appLang/appLocale.dart';

class roundRectButton extends StatefulWidget {
  final Color color;
  final String text;
  final Function()? func;
  const roundRectButton({Key? key,this.color=Colors.orange,this.text="",this.func}) : super(key: key);

  @override
  _roundRectButtonState createState() => _roundRectButtonState();
}

class _roundRectButtonState extends State<roundRectButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 50,
        child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:widget.color,
            textStyle: const TextStyle(fontSize: 20,color: Colors.black),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          onPressed:widget.func,
          child:Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children:
              [
                SizedBox(width:160, child:Align(alignment:Alignment.center,child:Text(widget.text))
                ),
                Icon(Icons.arrow_forward, color: Colors.white, size: 50,
                )
              ]
          ),
        )
    );
  }
}

//to remove aft confirmation
/*class rectRoundedCornerButton extends StatefulWidget {
  final String text;
  final double? height;
  //final String lang;
  final bool condition;
  final void Function() func;

  const rectRoundedCornerButton({Key? key,required this.func,required this.condition,this.text='',this.height}) : super(key: key);

  @override
  State<rectRoundedCornerButton> createState() => _rectRoundedCornerButtonState();
}

class _rectRoundedCornerButtonState extends State<rectRoundedCornerButton> {
var _condition=false;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height:widget.height,
      width:double.infinity ,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:_condition ? Colors.white : Colors.orange,
          textStyle: const TextStyle(fontSize: 20,color: Colors.black),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        onPressed: (){
            widget.func();

        },

        child:Text(widget.text),

          ),



    );
  }
}*/

class backButton extends StatelessWidget {
  const backButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.transparent,
      child: IconButton(
          icon: const Icon(Icons.arrow_back,size:50),

          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );

  }
}
