
import 'package:flutter/material.dart';
import'/reusable/boxDecoration.dart';

Widget columnLayoutWithGradientBackground(List<Widget> children){
  return SafeArea(
      child: Container(
      decoration: pinkYellowGradient,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children
  ,),
  ),);
}