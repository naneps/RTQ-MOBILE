import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/widget_number.dart';
import 'package:tahfidz/model/nilai.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';

class CardPelajaran extends StatefulWidget {
  // double? nilai = 0;
  int? nomor;
  Pelajaran? pelajaran;
  CardPelajaran({this.pelajaran, this.nomor, Key? key}) : super(key: key);

  @override
  State<CardPelajaran> createState() => _CardPelajaranState();
}

class _CardPelajaranState extends State<CardPelajaran> {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("args card pe;ajaran  $args");
    print(widget.pelajaran!.id);
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(35))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetNumber(
            number: widget.nomor.toString(),
          ),
          Container(
            width: 140,
            // color: Colors.blueAccent,
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              widget.pelajaran!.namaPelajaran!,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            // color: Colors.blueAccent,
            // height: 90,
            width: 120,
            child: FutureBuilder<Nilai>(
              future: RemoteServices.filterNilai(
                  token: SpUtil.getString('token'),
                  idPelajaran: widget.pelajaran!.id.toString(),
                  idSantri: args[2].id),
              builder: (context, AsyncSnapshot snapshot) {
                print("data nilai ${snapshot.data}");
                if (snapshot.hasData) {
                  Nilai nilai = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(nilai.nilai!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                          )),
                      Slider(
                        thumbColor: mainColor,
                        activeColor: mainColor,
                        inactiveColor: mainColor.withOpacity(0.2),
                        min: 0,
                        max: 100,
                        label: "${nilai.nilai}",
                        value: double.parse(nilai.nilai!),
                        divisions: 10,
                        onChanged: (value) async {
                          // print("nilai $value");
                          setState(() {
                            nilai.nilai = value.toInt().toString();
                          });
                        },
                        onChangeStart: (value) {
                          print("nilai $value");
                          setState(() {
                            nilai.nilai = value.toInt().toString();
                          });
                        },
                        onChangeEnd: (value) async {
                          print("nilai $value");
                          setState(() {
                            nilai.nilai = value.toInt().toString();
                          });
                          await RemoteServices.updateNilai(
                              token: SpUtil.getString('token'),
                              idAsatidz: SpUtil.getString('id'),
                              nilai: value,
                              idNilai: nilai.id.toString());
                          setState(() {
                            nilai.nilai = value.toInt().toString();
                          });
                        },
                      )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                      child: TextButton(
                    onPressed: () async {
                      print(args);
                      await RemoteServices.createNilai(
                          idAsatidz: SpUtil.getString('id'),
                          token: SpUtil.getString('token'),
                          idPelajaran: widget.pelajaran!.id.toString(),
                          idSantri: args[1].id,
                          nilai: 0.toString());
                      setState(() {});

                      // print(snapshot.data);
                    },
                    child: Text("Tambah Nilai"),
                  ));
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return const Center(
                    child: Text("Nilai Kosong"),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
