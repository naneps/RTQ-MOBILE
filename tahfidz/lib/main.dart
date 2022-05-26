import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/views/aurh/LoginPage.dart';
import 'package:tahfidz/views/asatidz/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(bodyText1: GoogleFonts.poppins()),
      ),
      title: "RTQ App",
      // theme: ThemeData(appBarTheme: ),
      debugShowCheckedModeBanner: false,
      home: (SpUtil.getBool('isLogin') != true)
          ? const LoginPage()
          : HomeScreen(),
    );
  }
}
