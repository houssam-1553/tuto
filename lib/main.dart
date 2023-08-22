import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Challenges/PasswordCH/RulesPage.dart';
import 'Pages/FirstPage.dart';


void main() {
  /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide the status bar for the entire app


    // Set the SystemUiOverlayStyle to match your design preferences
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lalezar-Regular', // Specify your custom font family here
      ),
      home: SplashScreen(),
      /*home: FirstPage(gradientColors: [
        Colors.purple[300]!,
        Colors.cyan,
      ],),*/
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




