import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuto/Challenges/PasswordCH/passwordPage1.dart';

import '../../main.dart';



class RulesPage extends StatelessWidget {
  final List<Color> gradientColors;

  RulesPage({required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: gradientColors,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Password challenge",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white60,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Color(0xF6E5E5B8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 300,
                  height: 400,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Challenge Rules',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipi',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => passwordPage1(
                        gradientColors: [
                          Colors.purple[300]!,
                          Colors.cyan,
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  // Change the button color
                  foregroundColor: Colors.white,
                  // Change the text color
                  maximumSize: Size(200, 50),

                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // Adjust button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Round button corners
                  ),
                ),
                child: Center(
                  child: Text(
                    'Start the Challenge',
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}