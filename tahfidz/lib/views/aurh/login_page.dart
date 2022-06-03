import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/custom_text_field.dart';
import 'package:tahfidz/controllers/auth_controllers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showPass = true;
  final argumen = Get.arguments;
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    print(argumen['id']);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Container(
            // height: MediaQuery.of(context).size.height / 1,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 290,
                  child: AnimatedTextKit(
                    // totalRepeatCount: 10,
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Selamat datang di Rumah Tahfidz Qur"an',
                        textStyle: GoogleFonts.poppins(
                          color: kFontColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        curve: Curves.linearToEaseOut,
                      )
                      // speed: Duration(seconds: 3)),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
                //
                const SizedBox(height: 20),
                Text(
                  "Masuk Sebagai ${argumen['hakAkses']}",
                  style: GoogleFonts.poppins(
                      color: kFontColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: authController.teleponeController,
                  inputType: TextInputType.phone,
                  icon: Icons.phone,
                  hintText: "Telepon",
                  labelText: "Telepon",
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: authController.passwordController,
                  obscureText: showPass,
                  icon: Icons.lock,
                  suffIcon: IconButton(
                    icon: Icon(
                        (showPass ? Icons.visibility_off : Icons.visibility)),
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                  hintText: "Kata Sandi",
                  labelText: "Kata Sandi",
                ),

                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      // print(authController.teleponeController.text);
                      // print(authController.passwordController.text);
                      // if (_formKey.currentState!.validate()) {
                      authController
                          .login(
                              idRole: int.parse(argumen['id']),
                              telepon: authController.teleponeController.text,
                              password: authController.passwordController.text)
                          .then((value) {
                        if (!value!) {
                          Get.snackbar(
                            'Autentikasi Gagal',
                            'Periksa Telepon dan Kata Sandi Anda',
                            icon: const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            backgroundColor: Colors.white,
                            colorText: Colors.black,
                            borderRadius: 10,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.all(10),
                            duration: const Duration(seconds: 2),
                          );
                        }
                      });
                      // }
                      // print(authController.teleponeController.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      child: Text(
                        "Masuk!",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
