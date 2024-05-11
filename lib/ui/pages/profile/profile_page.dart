import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(0, -1.4),
            image: AssetImage('./lib/images/ellipse.png'),
          ),
        ),
        child: Column(
          children: [
            Text(
              'GUINTO,',
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            Text(
              'Sheina V.',
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondary,
              ),
              child: Image.asset(
                fit: BoxFit.fill,
                './lib/images/user_black.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 18),

            Align(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PERSONAL INFORMATION',
                      style: TextStyle(fontSize: 20),
                    ),
                    // SizedBox(height: 14),
                    Text(
                      textAlign: TextAlign.start,
                      'Birthdate: 10/03/2005',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Gender: Female',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Text(
                      'Location: General Santos City',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'CONTACT INFORMATION',
                      style: TextStyle(fontSize: 20),
                    ),

                    Text(
                      'Email Address: example@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Phone Number: 09914725836',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]),
            ),
            // SizedBox(
            //   height: 12,
            // ),
            Expanded(
              child: Container(),
            ),
            Text(
              'DELETE ACCOUNT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 127, 127),
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(255, 255, 127, 127),
              ),
            )
          ],
        ),
      ),
    );
  }
}
