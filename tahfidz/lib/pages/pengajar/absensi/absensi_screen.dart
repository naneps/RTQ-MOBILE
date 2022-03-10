import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tahfidz/components/constants.dart';
import 'package:tahfidz/components/profile_avatar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AbsensiScreen(),
    ));

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  final List users = List.generate(50, (index) {
    return {
      'id': index,
      'name': "Hakim Asrori",
      'avatar': "",
    };
  });

  bool _isAccepted = false;
  Color hadir = Colors.green;
  Color izin = Colors.blue;
  Color sakit = Colors.yellow;
  Color alpa = Colors.red;
  Color? targetC;
  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Absensi",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      body: Container(
        // physics: BouncingScrollPhysics(),s
        height: heightBody,
        // color: Colors.black,

        child: Column(
          children: [
            Container(
              height: heightBody / 5,
              width: widhtBody,
              // color: Colors.black,
              child: Stack(
                // fit: StackFit.expand,
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    height: 100,
                    width: widhtBody,
                    child: Container(
                      // color: mainColor,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          ),
                          color: mainColor),
                      // width: widhtBody,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    height: 150,
                    width: widhtBody / 1.2,
                    child: Card(
                      // color: mainColor,
                      elevation: 1,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // mainAxisSize: MainAxisSize.min,

                          children: [
                            Draggable(
                              feedback: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: hadir.withOpacity(0.5),
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                              data: hadir,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: hadir,
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                            ),
                            Draggable(
                              feedback: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: izin.withOpacity(0.5),
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                              data: izin,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: izin,
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                            ),
                            Draggable(
                              feedback: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: sakit.withOpacity(0.5),
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                              data: sakit,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: Colors.yellow,
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                            ),
                            Draggable(
                              feedback: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: alpa.withOpacity(0.5),
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                              data: alpa,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Material(
                                  color: alpa,
                                  shape: StadiumBorder(),
                                  elevation: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: heightBody / 16,
              width: widhtBody / 1.4,
              // color: Colors.black,
              child: Card(
                elevation: 5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: heightBody / 2.2,
              width: widhtBody,
              // color: Colors.black,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              // color: Colors.green,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index]['id'];
                  return buildUser(index, user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUser(int index, dynamic user) => Card(
        key: ValueKey(user),
        elevation: 2,
        // shape: ShapeBorder,
        margin: EdgeInsets.all(10),
        child: ListTile(
          key: ValueKey(index),
          title: Text(
            "${users[index]['name']}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          // contentPadding: EdgeInsets.all(5),
          trailing: InnerShadowBox(
            child: DragTarget(
              onAccept: (
                value,
              ) {
                _isAccepted = true;
                targetC = value as Color?;
                // users[index];
                print(user[index]['id']);
              },
              builder: (context, candidate, rejected) {
                return (_isAccepted)
                    ? SizedBox(
                        width: 35,
                        height: 35,
                        child: Material(
                          color: targetC,
                          shape: StadiumBorder(),
                          elevation: 1,
                        ),
                      )
                    : Text('no');
              },
            ),
          ),

          leading: CircleAvatar(

              // child: Text("te"),
              ),
        ),
      );
}

class InnerShadowBox extends StatelessWidget {
  final Widget child;
  const InnerShadowBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        boxShadow: [
          //CSS: inset 0px 4px 6px rgba(8, 56, 73, 0.5)
          BoxShadow(
            color: Colors.grey, // shadow color
            offset: Offset(4, 4),
          ),
          BoxShadow(
            offset: Offset(0, 4),

            blurRadius: 3,
            // color: Colors.grey, // shadow color
            color: Color(0xFFF9F8F9), // background color
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child: child,
      ),
    );
  }
}
