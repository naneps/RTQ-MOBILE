import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';

import 'package:tahfidz/components/search_box.dart';
import 'package:tahfidz/controllers/santri_controller.dart';
import 'package:tahfidz/model/santri.dart';
import 'package:tahfidz/views/asatidz/absensi/components/indicator_absensi.dart';
import 'package:tahfidz/views/asatidz/absensi/components/card_santri.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  bool _isAccepted = false;
  Color hadir = Colors.green;
  Color izin = Colors.blue;
  Color sakit = Colors.yellow;
  Color alpa = Colors.red;

  Color? absenColor;
  String selectAbsen = 'hadir';
  final SantriController santriController = Get.put(SantriController());
  final _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: mainColor,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absensi",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      body: Column(
        children: [
          Container(
            height: heightBody / 6,
            width: widhtBody,
            // color: Colors.black,
            child: Stack(
              // fit: StackFit.expand,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  height: 100,
                  width: widhtBody,
                  child: Container(
                    // color: mainColor,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                        color: mainColor),
                    // width: widhtBody,
                  ),
                ),
                Positioned(
                  top: 0,
                  height: 150,
                  width: widhtBody / 1.2,
                  child: CardAbsensi(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBox(
              labelText: "Cari Santri",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                  width: widhtBody,
                  height: heightBody / 2,
                  // color: mainColor,
                  child: Obx(
                    () {
                      if (santriController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.yellow,
                            strokeWidth: 10,
                            // value: 1,
                            color: mainColor,
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: santriController.listSantri.length,
                        itemBuilder: (context, index) {
                          return CardSantri(
                            key: ObjectKey(
                                santriController.listSantri[index].id),
                            absenIndikator: absenColor,
                            onTap: () => _onButtonPressed(
                                santriController.listSantri[index]),
                            santri: santriController.listSantri[index],
                          );
                        },
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void _onButtonPressed(Santri santri) {
    showModalBottomSheet(
      // shape: RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => selectedItem(hadir, santri),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Material(
                    color: hadir,
                    shape: StadiumBorder(),
                    elevation: 4,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: izin,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: sakit,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: alpa,
                  shape: StadiumBorder(),
                  elevation: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void selectedItem(Color color, Santri santri) {
    setState(() {
      absenColor = color;
    });
    // dispose();
  }
}

class InnerShadowBox extends StatelessWidget {
  final Widget? child;
  InnerShadowBox({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        boxShadow: [
          //CSS: inset 0px 4px 6px rgba(8, 56, 73, 0.5)
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            offset: Offset(4, 4),
          ),
          BoxShadow(
            offset: Offset(0, 4),

            blurRadius: 3,
            // color: Colors.grey, // shadow color
            color: Color(0xFFF9F8F9), // background color
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: child,
      ),
    );
  }
}
