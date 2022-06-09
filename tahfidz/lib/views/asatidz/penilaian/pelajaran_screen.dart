import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/kategori_penilaian.dart';
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
  int? selectedItem;
  Future<List<KategoriPenilaian>>? listPelajaran;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem;
    listPelajaran =
        RemoteServices.fetchKategoriPenilaian(SpUtil.getString('token')!);
  }

  // var get = Get
  @override
  String? selectedKategori;
  Widget build(BuildContext context) {
    print("args pelajaran screen $args");
    // print(kategori);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penilaian",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: FutureBuilder<List<KategoriPenilaian>>(
          future:
              RemoteServices.fetchKategoriPenilaian(SpUtil.getString("token")!),
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
                          idKategori: snapshot.data![index].id.toString())
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
          token: SpUtil.getString("token")!,
          idJenjang: args[0].toString(),
          idKategoriPenilaian: idKategori),
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
          return Container(
            // color: Colors.amberAccent,
            height: Get.height / 2,
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
          return Container();
        }
      }),
    );
  }
}
