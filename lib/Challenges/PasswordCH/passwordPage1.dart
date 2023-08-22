
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'RulesPage.dart';

class passwordPage1 extends StatefulWidget {

  final List<Color> gradientColors;

  passwordPage1({required this.gradientColors});

  @override
  _PasswordPage1State createState() => _PasswordPage1State();
}





  // Define the list of player data here
class _PasswordPage1State extends State<passwordPage1> {
  List<Map<String, dynamic>> playerDataList = [
    {
      'name': 'Harry Maguire',
      'image': 'assets/images/harryy.png',
      'info': '30 yrs old center back played in Leicester City, now in Manchester United',
    },
    {
      'name': 'Riyad Mahrez',
      'image': 'assets/images/mahrez.png',
      'info': 'Some information about the player',
    },
    // Add more player entries as needed...
  ];
  int currentPlayerIndex = 0;

  get gradientColors => [
    Colors.purple[300]!,
    Colors.cyan,
  ];
  Timer? _timer;
  int _remainingSeconds = 30;
  bool _timerRunning = true;

  void startOrResetTimer() {
    _timer?.cancel(); // Cancel the existing timer if running

    setState(() {
      _remainingSeconds = 30;
    });

    if (_timerRunning) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            timer.cancel();
          }
        });
      });
    }

    setState(() {
      _timerRunning = !_timerRunning; // Toggle the timer state
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child :Container(
          padding: EdgeInsets.all(30),
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
                  "Password challenge",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white60,
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

                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          playerDataList[currentPlayerIndex]['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Image.asset(
                          playerDataList[currentPlayerIndex]['image'],
                          height: 200,
                          width: 200,
                        ),
                        Text(playerDataList[currentPlayerIndex]['info'])
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          currentPlayerIndex = (currentPlayerIndex + 1) % playerDataList.length;
                          startOrResetTimer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        // Change the button color
                        foregroundColor: Colors.white,
                        // Change the text color


                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // Adjust button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10), // Round button corners
                        ),
                      ).copyWith(
                        minimumSize: MaterialStateProperty.all(Size(70, 70)), // Adjust the size
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      ),
                      icon: Image.asset("assets/images/user2.png"),
                      label: Text("+1",
                        style:TextStyle(fontSize: 20),),

                    ),
                    Card(
                      color: Color(0xF6E5E5B8),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: 100,

                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Image.asset("assets/images/user2.png"
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '-',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset("assets/images/user1.png"),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
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

                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // Adjust button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10), // Round button corners
                        ),
                      ).copyWith(
                        minimumSize: MaterialStateProperty.all(Size(70, 70)), // Adjust the size
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      ),
                      icon: Image.asset("assets/images/user1.png"),
                      label: Text("+1",
                        style:TextStyle(fontSize: 20),),


                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(child: Align(
                  alignment: Alignment.bottomCenter,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : [

                      ElevatedButton.icon(
                        onPressed: () {
                          startOrResetTimer();

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade300,
                          // Change the button color
                          foregroundColor: Colors.black54,
                          // Change the text color

                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          // Adjust button padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), // Round button corners
                          ),
                        ).copyWith(
                          minimumSize: MaterialStateProperty.all(Size(170, 70)), // Adjust the size
                          padding: MaterialStateProperty.all(EdgeInsets.all(7)),
                        ),
                        icon: Icon(Icons.timer),
                        label: Text("00:$_remainingSeconds"),


                      ),
                      SizedBox(
                        width: 20,
                      ),

                  ElevatedButton.icon(
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
                      backgroundColor: Colors.yellow.shade300,
                      // Change the button color
                      foregroundColor: Colors.black54,
                      // Change the text color

                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // Adjust button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10), // Round button corners
                      ),
                    ).copyWith(
                      minimumSize: MaterialStateProperty.all(Size(170, 70)), // Adjust the size
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    ),
                    icon: Icon(Icons.arrow_back),
                    label: Text("Back to Rules"),


                  ),
                ],
                ),
                ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
