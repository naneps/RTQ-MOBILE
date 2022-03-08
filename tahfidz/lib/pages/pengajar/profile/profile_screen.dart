// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';
import 'package:tahfidz/controllers/profile_controller.dart';

import 'package:tahfidz/model/profil.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: ProfileScreen(
//       telepon: '',
//     ),
//   ));
// }
enum Gender { lakiLaki, perempuan }

class ProfileScreen extends StatefulWidget {
  final String? telepon;

  ProfileScreen({this.telepon});
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showPassword = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dataTiru = DateTime.utc(2022, 10, 10);
  ProfileController profileController = ProfileController();
  // final tahun_lahir = dataTiru.year;
  DateTime tanggal_lahir = DateTime.utc(2022, 10, 10);
  String? avatar;

  final List<String> _jenisKelamin = <String>['Laki-laki', 'Perempuan'];

  Gender _gender = Gender.lakiLaki;
  @override
  void initState() {
    super.initState();
    // getUser();
    // profileController.getProfil(widget.telepon!);
  }

  getUser() async {
    final client = RetryClient(http.Client());
    try {
      var response = await client
          .get(Uri.parse(link_public + 'info_profil/' + widget.telepon!));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        ProfileController.nama.text = jsonResponse['data']['nama'];
        ProfileController.alamat.text = jsonResponse['data']['no_hp'];
        ProfileController.teleponLama.text = jsonResponse['data']['no_hp'];
        ProfileController.telepon.text = jsonResponse['data']['no_hp'];
        ProfileController.jenisKelamin.text = jsonResponse['data']['alamat'];
        ProfileController.tanggalLahir.text =
            jsonResponse['data']['tanggal_lahir'];
        ProfileController.tempatLahir.text = jsonResponse['data']['alamat'];
        avatar = jsonResponse['data']['gambar'];
        profileController.getProfil(widget.telepon!);
      } else {
        dataFailed();
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widthBody = MediaQuery.of(context).size.width;

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: widthBody,
                height: heightBody / 3.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: widthBody,
                        height: 145,
                        // margin: const EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(90.0),
                            bottomLeft: Radius.circular(90.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: FutureBuilder(
                        future: profileController.getProfil(widget.telepon!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.yellow,
                                strokeWidth: 10,
                                // value: 1,
                                color: mainColor,
                              ),
                            );
                          }
                          return Card(
                            elevation: 5,
                            shape: const CircleBorder(),
                            child: ProfilePicture(
                              sizeAvatar: 150,
                              avatar: snapshot.data['data']['gambar'],
                              // sizeBtn: 0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: mainColor,
                width: widthBody,
                height: heightBody / 2,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  // reverse: true,
                  // physics: const FixedExtentScrollPhysics(),

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        buildTextField("Nama", ProfileController.nama.text,
                            false, false, ProfileController.nama),
                        buildTextField(
                            "Telepon",
                            ProfileController.telepon.text,
                            false,
                            false,
                            ProfileController.telepon),
                        buildTextField("Alamat", ProfileController.alamat.text,
                            false, false, ProfileController.alamat),
                        buildTextField(
                            "Tanggal Lahir",
                            ProfileController.tanggalLahir.text,
                            false,
                            false,
                            ProfileController.tanggalLahir),
                        buildTextField(
                            "Tempat Lahir",
                            ProfileController.tempatLahir.text,
                            false,
                            false,
                            ProfileController.tempatLahir),
                        // buildRadioGender(),
                        // example(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlineButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("Batal",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print(ProfileController.nama.text);
                                print(ProfileController.alamat.text);
                                print(ProfileController.telepon.text);
                                print(ProfileController.tanggalLahir.text);
                                print(ProfileController.tempatLahir.text);
                              },
                              color: mainColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "Simpan",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildRadioGender() {
    return Wrap(
      alignment: WrapAlignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        ListTile(
          title: const Text('Laki-Laki'),
          leading: Radio<Gender>(
            value: Gender.lakiLaki,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Perempuan'),
          leading: Radio<Gender>(
            value: Gender.perempuan,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, bool type, dynamic controller) {
    const typekey = TextInputType.number;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,

        obscureText: isPasswordTextField ? showPassword : false,
        // ignore: dead_code
        keyboardType: (type == true) ? typekey : null,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  void dataFailed() {
    Fluttertoast.showToast(
        msg: "Data gagal diambil!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
