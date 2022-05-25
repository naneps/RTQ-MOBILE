// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_pelajaran.dart';

class PelajaranScreen extends StatefulWidget {
  const PelajaranScreen({Key? key}) : super(key: key);

  @override
  State<PelajaranScreen> createState() => _PelajaranScreenState();
}

class _PelajaranScreenState extends State<PelajaranScreen> {
  final args = Get.arguments;
  // var get = Get
  @override
  Widget build(BuildContext context) {
    print("args $args");
    // print(kategori);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Penilaian ${args[0].kategoriPenilaian}",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: FutureBuilder<List<Pelajaran>?>(
                  future: RemoteServices.filterPelajaran(
                      SpUtil.getString('token')!,
                      args[1].toString(),
                      args[0].id.toString()),
                  builder: (context, AsyncSnapshot snapshot) {
                    print("Data Pelajaran : ${snapshot.data}");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData == []) {
                      return Text(snapshot.data.toString());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Terjadi Kesalahan"),
                      );
                    } else {
                      return const Center(
                        child: Text("Terjaddi Kesalahan"),
                      );
                    }
                  }
                  // print(snapshot.data);

                  ),
            )
          ],
        ),
      ),
    );
  }
}
