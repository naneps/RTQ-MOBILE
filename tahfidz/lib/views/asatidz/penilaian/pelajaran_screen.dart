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
  // var get = Get
  @override
  Widget build(BuildContext context) {
    print("args pelajaran screen $args");
    // print(kategori);
    return Scaffold(
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 10),
        child: FutureBuilder<List<KategoriPenilaian>>(
          future:
              RemoteServices.fetchKategoriPenilaian(SpUtil.getString("token")!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData || snapshot.hasError) {
              return const Center(
                child: Text("Tidak Ada Data"),
              );
            }
            return Container(
              // color: Colors.amber,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![index].kategoriPenilaian!,
                        style: GoogleFonts.poppins(),
                      ));
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 191, 191, 191),
              valueColor: AlwaysStoppedAnimation<Color>(mainColor),
            ),
          );
        } else if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardPelajaran(
                  pelajaran: snapshot.data![index],
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
