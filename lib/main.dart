import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lalezar-Regular', // Specify your custom font family here
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool isLogoBig = false;
  late AnimationController _controller;
  final Duration animationDuration = Duration(milliseconds: 500);
  final Duration splashDuration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    // Start the logo animation after a delay
    Timer(splashDuration, () {
      toggleLogoSize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleLogoSize() {
    setState(() {
      isLogoBig = !isLogoBig;
    });

    if (isLogoBig) {
      _controller.forward().whenComplete(() {
        // Navigation to the next page after the animation completes
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstPage(
              gradientColors: [
                Colors.purple[300]!,
                Colors.cyan,
              ],
            ),
          ),
        );
      });
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.purple[300]!,
              Colors.cyan,
            ],
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: toggleLogoSize,
            child: AnimatedContainer(
              duration: animationDuration,
              width: isLogoBig ? 400 : 000,
              // Set the desired width of the logo
              height: isLogoBig ? 400 : 000,
              // Set the desired height of the logo
              child: LogoWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your logo image widget, for example, you can use Image.asset or Image.network
    return Image.asset(
      'assets/images/logo.png', // Replace 'assets/logo.png' with the path to your logo image
    );
  }
}

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
                  "First challenge",
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

class passwordPage1 extends StatelessWidget {
  final List<Color> gradientColors;

  passwordPage1({required this.gradientColors});

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

                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Center(
                        child: Text(
                          'Harry Maguire',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset("assets/images/harryy.png"
                      ,height: 200,
                        width: 200,
                      ),
                      Text("30 yrs old center back played in leicester city now in manchester united ")
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstPage(
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
                    icon: Image.asset("assets/images/user2.png"),
                    label: Text("+1",
                    style:TextStyle(fontSize: 20),),

                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstPage(
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
                    label: Text("+1"),


                  ),
                ],
              ),
              SizedBox(height: 20,),
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
    );
  }
}
