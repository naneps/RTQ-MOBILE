import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/walisantri/profile_santri/components/card_santri.dart';

class ProfileAnakScreen extends StatelessWidget {
  const ProfileAnakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Santri",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kFontColor,
          ),
        ),
        backgroundColor: kBackground,
        centerTitle: true,
        // excludeHeaderSemantics: true,
        elevation: 0,
      ),
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Container(
              padding: const EdgeInsets.all(10),
              width: size.width,
              height: size.height,
              child: FutureBuilder(
                future: RemoteServices.getSantriByWali(),
                builder: (context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          mainColor,
                        ),
                      ),
                    );
                  } else {
                    // return Center()
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return CardSantri(
                        id_jenjang: snapshot.data[index]['id_jenjang'],
                        id: snapshot.data[index]['id'].toString(),
                        nama: snapshot.data[index]['nama'],
                        nis: snapshot.data[index]['nis'],
                        foto: snapshot.data[index]['foto'],
                        jenjang: snapshot.data[index]['jenjang'],
                      );
                    },
                  );
                },
              )),
        ),
      ),
    );
  }
}
