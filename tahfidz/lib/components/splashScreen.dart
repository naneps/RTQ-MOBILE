import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tahfidz/main.dart';

void main() => runApp(MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/Coba.json", animate: true),
            ),
            Text(
              "Rumah Tahfidz",
              style: GoogleFonts.poppins(
                  fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 5),
            )
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SplashScreen(),
      nextScreen: MyApp(),
      duration: 2000,
    );
  }
}
