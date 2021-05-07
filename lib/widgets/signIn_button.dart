import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Container(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                  color: Colors.grey[600].withOpacity(0.8),
                  fontSize: 15),
            ),
            SizedBox(width: 3),
            Text(
              'Sign in',
              style: TextStyle(color: Color(0xff0176ff), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}