import 'package:flutter/material.dart';

class TextResultWidget extends StatelessWidget {
final  String  text1 ;
final  dynamic text2 ;
TextResultWidget(
{
  required this.text1 ,
  required this.text2
}

    );
  @override
  Widget build(BuildContext context) {
    return Text('$text1: $text2 ',style:  const TextStyle(
        fontSize: 40 ,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),);
  }
}
