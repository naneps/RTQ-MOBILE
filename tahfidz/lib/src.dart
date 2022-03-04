// // Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Positioned(
// //               top: 0,
// //               height: 252,
// //               width: widhtBody,
// //               child: Container(
// //                 decoration: const BoxDecoration(
// //                     color: Color.fromARGB(255, 24, 0, 238),
// //                     borderRadius: BorderRadius.only(
// //                         bottomLeft: Radius.circular(50),
// //                         bottomRight: Radius.circular(50))),
// //               ),
// //             ),
// //             Positioned(
// //               top: 100,
// //               width: widhtBody / 1.25,
// //               height: heightBody / 2.7,
// //               child: Card(
// //                 color: Colors.white,
// //                 shape: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(35),
// //                   borderSide: BorderSide(
// //                     color: Colors.transparent,
// //                   ),
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.all(20),
// //                   child: Column(children: const [
// //                     CircleAvatar(
// //                       radius: 50,
// //                       backgroundColor: Colors.green,
// //                       child: CircleAvatar(
// //                         radius: 45,
// //                         backgroundImage: AssetImage('assets/images/avatar.png'),
// //                       ),
// //                     ),
// //                     SizedBox(height: 15),
// //                     Text(
// //                       "Nandang Eka Prasetya",
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     SizedBox(height: 10),
// //                     Text(
// //                       "Pengajar",
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ]),
// //                 ),
// //               ),
// //             ), //Hero Section
// //             Positioned(
// //               bottom: 30,
// //               // width: widhtBody / 1.25,
// //               // height: heightBody / 2.5,
// //               child: Container(
// //                 color: Colors.white,
// //                 child: Wrap(
// //                   spacing: 17,
// //                   runSpacing: 17,
// //                   children: [
// //                     ItemMenu(
// //                         title: 'Expend', icon: Icons.home, color: 0xffFED525),
// //                     ItemMenu(
// //                         title: 'Collection',
// //                         icon: Icons.star,
// //                         color: 0xffFD637B),
// //                     ItemMenu(
// //                         title: 'Incomes',
// //                         icon: Icons.monetization_on,
// //                         color: 0xff21CDFF),
// //                     ItemMenu(
// //                         title: 'Sales',
// //                         icon: Icons.show_chart,
// //                         color: 0xff7585F6)
// //                   ],
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Text(
//                 "Edit Profile",
//                 style: GoogleFonts.poppins(
//                     fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         bottom: 0,
//                         height: heightBody,
//                         width: widhtBody,
//                         child: Container(
//                           color: Colors.blue,
//                         )),
//                     Card(
//                       shape: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(199),
//                           borderSide: BorderSide(color: Colors.transparent)),
//                       elevation: 10,
//                       color: Colors.white,
//                       child: ProfilePicture(
//                         sizeAvatar: 130,
//                         sizeBtn: 30,
//                         sizeIcon: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 35,
//               ),
//               buildTextField(
//                   "Nama Lengkap", "Nandang Eka Prasetya", false, false),
//               buildTextField("Alamat ", "Lohbrner", false, false),
//               buildTextField("Jenis Kelamin", "Laki-Laki", false, false),
//               buildTextField(
//                   "Nomor Telepon", "Nandang Eka Prasetya", false, true),
//               buildTextField("Password", "********", true, false),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlineButton(
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text("CANCEL",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   RaisedButton(
//                     onPressed: () {},
//                     color: Colors.blue,
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Text(
//                       "SAVE",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),

// style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';

void main() => runApp(MaterialApp(
      home: Coba(),
    ));

class Coba extends StatelessWidget {
  const Coba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 10;
    final widthBody = MediaQuery.of(context).size.width;
    final heghtBody = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          "Profil",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widthBody,
              height: heghtBody / 3.5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: widthBody,
                      height: 145,
                      // margin: EdgeInsets.all(100.0),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(90.0),
                          bottomLeft: Radius.circular(90.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      child: Card(
                        elevation: 5,
                        shape: CircleBorder(),
                        child: ProfilePicture(
                          sizeAvatar: 150,
                          sizeBtn: 0,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              // color: mainColor,
              width: widthBody,
              height: heghtBody / 2,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    buildTextField("Nama", "Namamu"),
                    buildTextField("Nama", "Namamu"),
                    buildTextField("Nama", "Namamu"),
                    buildTextField("Nama", "Namamu"),
                    buildTextField("Nama", "Namamu"),
                    buildTextField("Nama", "Namamu"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () {
                            // print(_controllerTelepon.text);
                            // print(_controllerNama.text);
                          },
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SAVE",
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
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
  String labelText,
  String placeholder,
) {
  final typekey = TextInputType.number;
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      // controller: controller,
      // obscureText: isPasswordTextField ? showPassword : false,
      // ignore: dead_code
      // keyboardType: (type == true) ? typekey : null,
      decoration: InputDecoration(
          // suffixIcon: isPasswordTextField
          //     ? IconButton(
          //         onPressed: () {
          //           setState(() {
          //             showPassword = !showPassword;
          //           });
          //         },
          //         icon: Icon(
          //           Icons.remove_red_eye,
          //           color: Colors.grey,
          //         ),
          //       )
          // : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  );
}
