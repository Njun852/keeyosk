// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/pages/dashboard/dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _shouldRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 160, left: 60, right: 60),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('./lib/images/wave.png'),
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 3.95),
                      blurRadius: 5),
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Email',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 3.95),
                      blurRadius: 5),
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Password',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 30,
                    child: Checkbox(
                      activeColor: primary,
                      value: _shouldRemember,
                      onChanged: (val) {
                        setState(() {
                          _shouldRemember = val!;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              SizedBox(height: 14),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        )
                      ]),
                  width: 200,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(1),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                      backgroundColor: MaterialStatePropertyAll(secondary),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 64),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Sign In With',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('./lib/images/google.png'),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('./lib/images/facebook.png'),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('./lib/images/twitter.png'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(
                          255,
                          79,
                          108,
                          157,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
