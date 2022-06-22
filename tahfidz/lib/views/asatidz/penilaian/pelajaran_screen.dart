import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
import 'package:tahfidz/model/pelajaran.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/penilaian/components/card_pelajaran.dart';
import 'package:tahfidz/views/walisantri/prestasi/sertifikat_screen.dart';

class PelajaranScreen extends StatefulWidget {
  const PelajaranScreen({Key? key}) : super(key: key);

  @override
  State<PelajaranScreen> createState() => _PelajaranScreenState();
}

class _PelajaranScreenState extends State<PelajaranScreen> {
  final args = Get.arguments;
  int? selectedItem;
  Future<List<KategoriPenilaian>>? listPelajaran;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem;
    listPelajaran = RemoteServices.fetchKategoriPenilaian();
  }

  // var get = Get
  @override
  String? selectedKategori;
  Widget build(BuildContext context) {
    print("args pelajaran screen $args");
    // print(kategori);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.all(15),
          // color: Color.fromARGB(255, 255, 255, 255),
          width: 250,
          // height: 10,
          child: Text(
            "Penilaian ${args[1].namaLengkap}",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kFontColor,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: FutureBuilder<List<KategoriPenilaian>>(
          future: RemoteServices.fetchKategoriPenilaian(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  // child: CircularProgressIndicator(),
                  );
            } else if (!snapshot.hasData || snapshot.hasError) {
              return const Center(
                child: Text("Tidak Ada Data"),
              );
            }
            return Container(
              height: Get.height,
              // color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Penilaian " + snapshot.data![index].kategoriPenilaian!,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildListPelajara(
                          idKategori: snapshot.data![index].id.toString()),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildListPelajara({String? idKategori}) {
    return FutureBuilder<List<Pelajaran>?>(
      future: RemoteServices.filterPelajaran(
          idJenjang: args[0].toString(), idKategoriPenilaian: idKategori),
      builder: ((context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: const Color.fromARGB(255, 191, 191, 191),
              valueColor: AlwaysStoppedAnimation<Color>(mainColor),
            ),
          );
        } else if (snapshot.hasData) {
          return SizedBox(
            // color: Colors.amberAccent,
            height: Get.height / 3,
            width: double.infinity,
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Pelajaran pelajaran = snapshot.data![index];
                return CardPelajaran(
                  nomor: index + 1,
                  pelajaran: pelajaran,
                );
              },
            ),
          );
        } else {
          return Container(
              padding: EdgeInsets.all(10),
              // color: Color.fromARGB(255, 234, 96, 87),
              // height: 200,
              width: Get.width,
              child: WidgetEmpty(
                label: "Tidak Ada Data Pelajaran",
              ));
        }
      }),
    );
  }
}
