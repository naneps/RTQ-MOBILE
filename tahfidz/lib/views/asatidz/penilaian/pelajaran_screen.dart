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
    print("args $args");
    // print(kategori);
    return Scaffold(
      backgroundColor: kBackground,
      body: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 10),
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  // color: const Color.fromARGB(255, 145, 145, 145),
                  child: Column(
                    children: [
                      Text(
                          "Penilaian Pelajaran ${snapshot.data![index].kategoriPenilaian}",
                          style: GoogleFonts.poppins(
                              color: kFontColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                      FutureBuilder<List<Pelajaran>?>(
                        future: RemoteServices.filterPelajaran(
                            token: SpUtil.getString("token")!,
                            idJenjang: args[0].toString(),
                            idKategoriPenilaian:
                                snapshot.data![index].id.toString()),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor:
                                    Color.fromARGB(255, 191, 191, 191),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(mainColor),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            List<Pelajaran>? listPelajaran = snapshot.data;
                            print('list pelajaran $listPelajaran $index');
                            return SizedBox(
                              height: 300,
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
                      )
                      // buildListPelajara(
                      //     idKategori: snapshot.data![index].id.toString())
                    ],
                  ),
                );
              },
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
