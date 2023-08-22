import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Challenges/PasswordCH/RulesPage.dart';



class TeamNamesPage extends StatelessWidget {
  final List<Color> gradientColors;

  TeamNamesPage({required this.gradientColors});

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
                  Text(
                    "Team Names",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 450,
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              labelText: "team1",
                              prefixIcon: Image.asset(
                                'assets/images/user1.png',
                              ),
                            )),
                        TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              border: InputBorder.none,
                              labelText: "player1",
                            )),
                        TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white70,
                              labelText: "player2",
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 550,
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 207, 203, 203),
                              labelText: "team2",
                              prefixIcon: Image.asset(
                                'assets/images/user2.png',
                              ),
                            )),
                        TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 207, 203, 203),
                              border: InputBorder.none,
                              labelText: "player1",
                            )),
                        TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromARGB(255, 207, 203, 203),
                              labelText: "player2",
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
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
                      backgroundColor: Colors.lightGreen,
                      // Change the button color
                      foregroundColor: Colors.white,
                      // Change the text color
                      maximumSize: Size(200, 50),

                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // Adjust button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Round button corners
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Start the game',
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
