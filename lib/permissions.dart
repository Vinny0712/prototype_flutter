import 'package:eldtech_sos/reusable/buttons.dart';
import 'package:eldtech_sos/reusable/customLayout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
class permissions extends StatelessWidget {
  const permissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return columnLayoutWithGradientBackground([
      roundRectButton(text: 'logout',
      func:(){
        FirebaseAuth.instance.signOut();
        Navigator.of(context)
            .popUntil(ModalRoute.withName("/"));
      })
    ]);
  }
}
