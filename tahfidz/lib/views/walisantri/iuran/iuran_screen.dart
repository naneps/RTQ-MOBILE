import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/iuran.dart';
import 'package:tahfidz/services/remote_services.dart';
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
    RemoteServices.fetchIuran();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Iuran> listIuran = [];
    listIuran.add(
      Iuran(
          status: "Sudah Diterima",
          uang: "50000",
          id: '1',
          tglIuran: "20 Oktober 2002"),
    );
    listIuran.add(
      Iuran(
          status: "Sudah Diterima",
          uang: "80000",
          id: '1',
          tglIuran: "20 Oktober 2022"),
    );
    listIuran.add(
      Iuran(
          status: "Belum di terima",
          uang: "20000",
          id: '1',
          tglIuran: "20 Oktober 2002"),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Rekap Iuran"),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
        // bottom: Preff ,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            width: size.width,
            height: size.height,
            // color: mainColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Rekap iuran ",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                FutureBuilder(
                  future: RemoteServices.fetchIuran(),
                  builder: (context, snapshot) {
                    // Object? listIuran = snapshot.data;
                    // AsyncSnapshot<List<Iuran>?> listIuran = snapshot.data
                    print(snapshot.runtimeType);
                    return Container(
                      width: size.width,
                      height: 500,
                      child: ListView.builder(
                        itemCount: listIuran.length,
                        itemBuilder: (context, index) {
                          return CardIuran(
                            size: size,
                            iuran: listIuran[index],
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<dynamic, Iuran>> data = [];
