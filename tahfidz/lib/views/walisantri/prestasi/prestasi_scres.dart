import 'package:flutter/material.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/adab_page.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/hafalan_page.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/imla_page.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/mulok_page.dart';
import 'package:tahfidz/views/walisantri/prestasi/components/tadribat_page.dart';
// import 'package:tahfidz/components/constants.dart';

class PrestasiScreen extends StatefulWidget {
  const PrestasiScreen({Key? key}) : super(key: key);

  @override
  State<PrestasiScreen> createState() => _PrestasiScreenState();
}

class _PrestasiScreenState extends State<PrestasiScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabbarController;

  List<Tab> tabs = [
    const Tab(
      // icon: Icon(Icons.abc),
      child: Text(
        "Tadribat",
      ),
      // child: Container(),
    ),
    Tab(
      child: Text("Hafalan"),
    ),
    Tab(
      child: Text("Adab"),
    ),
    Tab(
      child: Text("Imla"),
    ),
    Tab(
      child: Text("Mulok"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
          title: const Text('Prestasi'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            TadribatPage(),
            HafalanPage(),
            AdabPage(),
            ImlaPage(),
            MuloktPage()
          ],
        ),
      ),
    );
  }
}
