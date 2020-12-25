import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  CustomRaisedButton(
      {this.child, this.borderRadius: 4.0, this.color, this.onPressed, this.height: 45});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // wrapping the button in a sized box to increase its height
        height: height,
        child: RaisedButton(
          child: child,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius)) // rounded edges for raised button
              ),
          onPressed: onPressed,
          color: color,
        ));
  }
}
