import 'package:flutter/material.dart';
import 'package:FMB/Screens/Login/common_widgets/raisedbutton.dart';
// @required annotation tells us the parameter is required, it only checks if a data is passed, does not check the value
// assert() runtime checks the value, it is used to pinpoint where the error is coming from in my source code, not flutter sdk
// can be used in conjunction with @required

class SocialSignInButon extends CustomRaisedButton {
  SocialSignInButon(
      {@required String text, Color textColor, VoidCallback onPressed, Color color, @required String imageURL})
      : assert(imageURL != null),
      assert(text != null),
      
      super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(imageURL),
              Text(text, style: TextStyle(fontSize: 15.0, color: textColor),),
              Opacity(opacity: 0.0, child: Image.asset(imageURL)),
            ],
          ),
          onPressed: onPressed,
          color: color,
        );
}
