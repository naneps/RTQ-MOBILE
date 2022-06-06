import 'package:flutter/material.dart';
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
        title: const Text("Profile Santri"),
        backgroundColor: mainColor,
        centerTitle: true,
        // excludeHeaderSemantics: true,
        elevation: 0,
      ),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
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
                    itemCount: snapshot.data.length ?? 0,
                    itemBuilder: (context, index) {
                      return CardSantri(
                        size: size,
                        nama: snapshot.data[index]['nama'],
                        nis: snapshot.data[index]['nis'],
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
