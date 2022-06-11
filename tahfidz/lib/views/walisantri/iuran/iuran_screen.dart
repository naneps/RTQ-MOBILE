import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/iuran_santri/iuran_santri._screen.dart';
import 'package:tahfidz/views/walisantri/iuran/components/card_iuran.dart';

class IuranScreen extends StatefulWidget {
  const IuranScreen({Key? key}) : super(key: key);

  @override
  State<IuranScreen> createState() => _IuranScreenState();
}

class _IuranScreenState extends State<IuranScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final argumen = Get.arguments;
    print(argumen['id']);
    return Scaffold(
      backgroundColor: kBackground,
      // backgroundColor: Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // bottom: Preff ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          // color: mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rekap Iuran Bulanan ",
                style: GoogleFonts.poppins(
                  color: kFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: RemoteServices.rekapIuranSantri(argumen['id']),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          mainColor,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      return Expanded(
                          child: Center(child: Text("Belum Bayar Iuran")));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CardIuranSantri(
                            nominal: snapshot.data[index]['nominal_pembayaran']
                                .toString(),
                            tanggal: snapshot.data[index]['tanggal_pembayaran'],
                            status: snapshot.data[index]['status_pembayaran'],
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Tidak ada data"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
