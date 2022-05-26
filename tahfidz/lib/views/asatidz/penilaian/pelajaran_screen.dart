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
      // appBar: AppBar(
      //   elevation: 0,
      //   // title: Text("Pelajaran"),
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Penilaian ${args[0].kategoriPenilaian}",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              child: FutureBuilder<List<Pelajaran>?>(
                  future: RemoteServices.filterPelajaran(
                      SpUtil.getString('token')!,
                      args[1].toString(),
                      args[0].id.toString()),
                  builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      // List<Pelajaran> list = snapshot.data;
                      // list.forEach((element) {
                      //   print(element.namaPelajaran);
                      // });
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return CardPelajaran(
                            pelajaran: snapshot.data![index],
                            nomor: index + 1,
                          );
                        },
                      );
                    } else if (!snapshot.hasData) {
                      return Center(child: const Text("Data Pelajaran Kosong"));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }

//

                  ),
            )
          ],
        ),
      ),
    );
  }
}
