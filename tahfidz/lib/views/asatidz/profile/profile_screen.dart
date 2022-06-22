import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/custom_text_field.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/controllers/auth_controllers.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Get.back();
              }),
          title: Text(
            "Profil",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                shape: const CircleBorder(),
                child: ProfilePicture(
                  avatar: SpUtil.getString('gambar'),
                  sizeAvatar: Get.width / 2.5,
                  widthBtn: 0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 2,
                child: CustomTextField(
                  hintText: SpUtil.getString('nama'),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 2,
                child: CustomTextField(
                  hintText: SpUtil.getString('jenis_kelamin') == 'L'
                      ? 'Laki-Laki'
                      : 'Perempuan',
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 2,
                child: CustomTextField(
                  hintText: SpUtil.getString('alamat'),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 2,
                child: CustomTextField(
                  hintText: SpUtil.getString('nama'),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 2,
                child: CustomTextField(
                  hintText: SpUtil.getString('nama'),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(15),
                          height: Get.height / 2.5,
                          color: Colors.white,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _authController.oldPassword,
                                  labelText: "Password Lama",
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Isi Password Lama';
                                    }
                                  },
                                ),
                                CustomTextField(
                                  controller:
                                      _authController.passwordController,
                                  labelText: "Password Baru",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Isi Password Baru';
                                    }
                                  },
                                ),
                                CustomTextField(
                                  controller: _authController.confirmPassword,
                                  labelText: "Konfirmasi Password",
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Konfirmasi Password';
                                    } else if (_authController
                                            .confirmPassword !=
                                        _authController.passwordController) {
                                      return 'Konfirmasi Password tidak sesuai';
                                    }
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Batal",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: redColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          print("ok");
                                        }
                                      },
                                      child: Text(
                                        "Simpan",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: greenColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        isScrollControlled: true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: greenSecond,
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Edit Password",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: kFontColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
