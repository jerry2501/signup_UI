import 'package:flutter/material.dart';
import 'package:sk_alert_dialog/sk_alert_dialog.dart';

import 'widgets/button.dart';
import 'widgets/signIn_button.dart';
import 'widgets/terms_ui.dart';

enum Gender { Male, Female, Other }

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Gender _gender = Gender.Male;

  String get _genderString {
    if (_gender == Gender.Male) {
      return 'Male';
    }
    if (_gender == Gender.Female) {
      return 'Female';
    }
    return 'Other';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.18,
            ),
            Container(
              width: width,
              child: Text(
                'Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              child: Text(
                'Welcome to LinkWork.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 15),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            _buildTextbox(width, height, 'Enter your company name', false),
            SizedBox(
              height: height * 0.025,
            ),
            _buildTextbox(width, height, 'Enter your name', false),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
              ),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xffedeef6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07, vertical: height * 0.02),
                  child: InkWell(
                      onTap: () {
                        SKAlertDialog.show(
                          context: context,
                          type: SKAlertType.custom,
                          customWidget: customWidget(),
                        );
                      },
                      child: Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_genderString,
                                style: TextStyle(color: Colors.grey[600])),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            _buildTextbox(width, height, 'Enter your email', false),
            SizedBox(
              height: height * 0.025,
            ),
            _buildTextbox(width, height, 'Enter your mobile number', false),
            SizedBox(
              height: height * 0.025,
            ),
            _buildTextbox(width, height, 'Enter your password', true),
            SizedBox(
              height: height * 0.025,
            ),
            _buildTextbox(width, height, 'Re-enter your password', true),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.06, right: width * 0.06, top: height * 0.03),
              child: Container(
                width: width,
                child: Text(
                  'Payable Amount: Rs: 3000/-',
                  style: TextStyle(
                      color: Colors.grey[600].withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.005,
              ),
              child: Container(
                width: width,
                child: Text(
                  'Valid Till: (07-05-2022)',
                  style: TextStyle(
                      color: Colors.grey[600].withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            TermsUI(width: width),
            SizedBox(height: height * 0.027),
            Button(width: width),
            SignInButton(height: height, width: width),
          ],
        ),
      ),
    );
  }

  Padding _buildTextbox(
      double width, double height, String text, bool obscure) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Color(0xffedeef6)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.005),
          child: TextFormField(
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customWidget() {
    return Column(
      children: [
        _genderWidget('Male', Gender.Male),
        Divider(thickness: 2),
        _genderWidget('Female', Gender.Female),
        Divider(thickness: 2),
        _genderWidget('Other', Gender.Other),
      ],
    );
  }

  Padding _genderWidget(String text, Gender value) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Radio(
            value: value,
            groupValue: _gender,
            onChanged: (v) {
              setState(() {
                _gender = v;
                Navigator.of(context).pop();
              });
            },
          ),
        ],
      ),
    );
  }
}
