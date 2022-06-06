import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/model/absen.dart';
import 'package:tahfidz/services/remote_services.dart';
import 'package:tahfidz/views/asatidz/absen_mandiri/components/card_attendance.dart';

class RekapAbsensiPage extends StatefulWidget {
  const RekapAbsensiPage({Key? key}) : super(key: key);

  @override
  State<RekapAbsensiPage> createState() => _RekapAbsensiPageState();
}

class _RekapAbsensiPageState extends State<RekapAbsensiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: kBackground,
      body: Container(
        height: Get.height,
        width: Get.width,
        // color: kMainColor,

        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(children: [
          Container(
            width: Get.width,
            height: Get.height / 2.5,
            color: Colors.amberAccent,
          ),
          Expanded(
              child: Container(
            color: Colors.blueAccent,
            child: FutureBuilder<List<Abesn>?>(
              future: RemoteServices.fetchRekapAbsen(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return CardAttendance(
                          abesn: snapshot.data![index],
                        );
                      });
                } else {
                  return Container();
                }
              },
            ),
          ))
        ]),
      ),
    );
  }
}
