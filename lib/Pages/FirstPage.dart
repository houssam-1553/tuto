import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Challenges/PasswordCH/RulesPage.dart';
import 'TeamNamesPage.dart';

class FirstPage extends StatelessWidget {
  final List<Color> gradientColors;

  FirstPage({required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: gradientColors,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //***** hna ghir ntesti fiha
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesPage(
                        gradientColors: [
                          Colors.purple[300]!,
                          Colors.cyan,
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  // Change the button color
                  foregroundColor: Colors.white,
                  // Change the text color
                  maximumSize: Size(200, 120),

                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // Adjust button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Round button corners
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3 Players Mode',
                      style: TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      'assets/images/arbitre.png',
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/user1.png',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('VS'),
                          SizedBox(
                            width: 20, //
                          ),
                          Image.asset(
                            'assets/images/user2.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamNamesPage(
                        gradientColors: [
                          Colors.purple[300]!,
                          Colors.cyan,
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lime,
                  // Change the button color
                  foregroundColor: Colors.white,
                  // Change the text color
                  maximumSize: Size(200, 120),

                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // Adjust button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Round button corners
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '5 Players Mode',
                      style: TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      'assets/images/arbitre.png',
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/user1.png',
                          ),
                          Image.asset(
                            'assets/images/user1.png',
                          ),
                          const SizedBox(
                            width: 20, //<-- SEE HERE
                          ),
                          Text('VS'),
                          const SizedBox(
                            width: 20, //<-- SEE HERE
                          ),
                          Image.asset(
                            'assets/images/user2.png',
                          ),
                          Image.asset(
                            'assets/images/user2.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
