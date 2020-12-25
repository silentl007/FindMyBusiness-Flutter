import 'package:FMB/Screens/Local/selectlga.dart';
import 'package:FMB/Screens/Logged/submit.dart';
import 'package:flutter/material.dart';
import 'package:FMB/Screens/Login/sign_in/signin_button.dart';
import 'package:FMB/Screens/Login/sign_in/socialsigninbutton.dart';
/* Column() widget has two properties that determines the verticality and horizontality of its widgets
-- maxAxisAlignment: responsible for verticality
-- crossAxisAlignment: responsible for horizontality
- CrossAxisAlignment.stretch overrides the default width of any widget and makes it stretch to the max width of its parent widget
 
 -- Padding() is a widget that takes only one property padding, useful for minimalistic touch
 -- Scaffold() widget has backgroundcolor property
 -- Images.asset('image location') is used to load images added to assets
 -- Opacity() is a widget that determines the level of visibilty of its child widgets
 */

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        elevation: 3.0,
      ),
      backgroundColor: Colors.grey[100], // bacground color of scaffold widget
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/blackback.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(
              19), // padding is space between child and parent widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // stretched all widgets to the max width
            mainAxisAlignment:
                MainAxisAlignment.center, // moved all widgets to the center
            children: <Widget>[
              Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              SocialSignInButon(
                imageURL: 'images/google-logo.png',
                text: 'Sign-in with Google',
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () => submit(context),
              ),
              SizedBox(
                height: 8,
              ),
              SocialSignInButon(
                imageURL: 'images/facebook-logo.png',
                text: 'Sign-in with Facebook',
                textColor: Colors.white,
                color: Colors.blueAccent,
                onPressed: () => showdiag(context),
              ),
              SizedBox(
                height: 8,
              ),
              SignInButon(
                text: 'Sign-in with Email',
                textColor: Colors.black,
                color: Colors.teal,
                onPressed: () => showdiag(context),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'or',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              SignInButon(
                text: 'Guest',
                textColor: Colors.black,
                color: Colors.lime,
                onPressed: () => gotolocallga(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // showdiag(BuildContext context) => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //         content: Text('Under development, please use the Guest section')));
    showdiag(BuildContext context) => showDialog(
      context: context,
      child: Container(
        color: Colors.transparent,
        child: AlertDialog(
          actions: [FlatButton(onPressed: ()=> Navigator.pop(context), child: Text('Close'),)],
            content: Text('Under development, please use the Guest section')),
      ));

  void gotolocallga(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocalLga()));
  }

  void submit(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Forms()));
  }
}
