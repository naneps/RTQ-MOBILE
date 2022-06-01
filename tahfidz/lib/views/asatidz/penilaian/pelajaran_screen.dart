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
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 100,
              alignment: Alignment.center,
              // color: mainColor,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    blurStyle: BlurStyle.inner,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FutureBuilder<List<KategoriPenilaian>>(
                future: RemoteServices.fetchKategoriPenilaian(
                    SpUtil.getString("token")!),
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
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width / 5,
                          height: 100,
                          padding: EdgeInsets.all(10),
                          // width: Get.width / 2.5,
                          color: mainColor,

                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            snapshot.data![index].kategoriPenilaian!,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
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
