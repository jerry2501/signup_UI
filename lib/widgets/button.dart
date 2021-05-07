import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Container(
        width: width,
        child: FlatButton(
            color: Color(0xff0176ff),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'Create an account and Pay',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            onPressed: () {}),
      ),
    );
  }
}