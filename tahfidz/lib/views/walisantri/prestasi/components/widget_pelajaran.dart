import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/widget_number.dart';
import 'package:tahfidz/model/nilai.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';

class WidgetPelajaran extends StatefulWidget {
  // double? nilai = 0;
  int? nomor;
  Pelajaran? pelajaran;
  WidgetPelajaran({this.pelajaran, this.nomor, Key? key}) : super(key: key);

  @override
  State<WidgetPelajaran> createState() => _WidgetPelajaranState();
}

class _WidgetPelajaranState extends State<WidgetPelajaran> {
  final argumen = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(35))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetNumber(
            number: widget.nomor.toString(),
          ),
          Expanded(
            child: Container(
              // color: Colors.blueAccent,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                widget.pelajaran!.namaPelajaran!,
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: FutureBuilder<Nilai>(
              future: RemoteServices.filterNilai(
                  idPelajaran: widget.pelajaran!.id.toString(),
                  idSantri: argumen['id'],
                  token: SpUtil.getString('token')),
              builder: (context, AsyncSnapshot snapshot) {
                print("data nilai ${snapshot.data}");
                if (snapshot.hasData) {
                  Nilai nilai = snapshot.data;
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color.fromARGB(255, 156, 255, 162),
                    child: Text(nilai.nilai.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        )),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!snapshot.hasData) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color.fromARGB(255, 255, 239, 215),
                    child: Text("Belum dinilai",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                        )),
                  );
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
