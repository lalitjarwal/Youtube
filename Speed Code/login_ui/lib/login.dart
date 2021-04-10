import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/register.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(color: Constants.black_s3, width: 4),
    );
    var textStyle = TextStyle(fontSize: 18);
    var linearGradient =
        LinearGradient(colors: [Constants.purple_pink, Constants.pink]);
    var gradientOutlineInputBorder = GradientOutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        focusedGradient: linearGradient,
        unfocusedGradient:
            LinearGradient(colors: [Constants.black_s3, Constants.black_s3]));
    var textStyle2 = TextStyle(color: Colors.white, fontSize: 18);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.black_s1,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      alignment: Alignment.center,
                      decoration: boxDecoration,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 26.0,
                      )),
                  const SizedBox(
                    width: 24.0,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Log in with one of following options',
                style: TextStyle(color: Colors.white54, fontSize: 16.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      decoration:
                          boxDecoration.copyWith(color: Constants.black_s2),
                      child: Image.asset(Constants.ic_google, width: 24),
                    ),
                  )),
                  const SizedBox(width: 20.0),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      decoration:
                          boxDecoration.copyWith(color: Constants.black_s2),
                      child: Image.asset(Constants.ic_apple, width: 24),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: textStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: textStyle2,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 16.0),
                    fillColor: Constants.black_s2,
                    border: gradientOutlineInputBorder),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Passsword',
                style: textStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: textStyle2,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 16.0),
                    fillColor: Constants.black_s2,
                    border: gradientOutlineInputBorder),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Login();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      gradient: linearGradient),
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white54, fontSize: 16.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
