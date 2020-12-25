import 'package:flutter/material.dart';
import 'package:FMB/Screens/Login/common_widgets/raisedbutton.dart';

class SignInButon extends CustomRaisedButton {
  SignInButon({String text, Color textColor, VoidCallback onPressed, Color color})
: super(
          child: Text(text,style: TextStyle(color: textColor, fontSize: 14),),
          onPressed: onPressed,
          color: color,
        );
}
