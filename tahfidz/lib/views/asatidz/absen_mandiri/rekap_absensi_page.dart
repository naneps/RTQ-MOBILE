import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
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
          Expanded(
            child: SizedBox(
              width: Get.width,
              height: Get.height / 2.5,
              // color: Colors.amberAccent,
              child: TableCalendar(
                // locale: 'id',
                calendarFormat: CalendarFormat.month,
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2019),
                lastDay: DateTime.utc(2060),
                // initialCalendarFormat: CalendarFormat.week,
              ),
              // child:
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "data",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<List<Absen>?>(
                  future: RemoteServices.fetchRekapAbsen(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
