import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';
// import 'package:tahfidz/components/constants.dart';

class PrestasiScreen extends StatelessWidget {
  const PrestasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Tadribat",
                // child: Container(),
              ),
              Tab(
                text: "Hafalan",
              ),
              Tab(
                text: "Adab",
              ),
            ],
          ),
          title: const Text('Prestasi'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
