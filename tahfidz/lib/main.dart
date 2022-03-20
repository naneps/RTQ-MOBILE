import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/pages/aurh/LoginPage.dart';
import 'package:tahfidz/pages/pengajar/home/home_screen.dart';

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
      // theme: ThemeData(appBarTheme: ),
      debugShowCheckedModeBanner: false,
      home: (SpUtil.getBool('status') != true)
          ? const LoginPage()
          : HomeScreen(telepon: SpUtil.getString('no_hp')!),
    );
  }
}
