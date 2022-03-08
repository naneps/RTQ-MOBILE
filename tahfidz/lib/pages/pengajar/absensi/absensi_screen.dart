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

  bool _isDropped = false;
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
        // color: Colors.white,
        child: Container(
          height: heightBody,
          width: widhtBody,
          // padding: EdgeInsets.all(20),
          // color: Colors.black26,
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
                                  child: Icon(Icons.sick),
                                  data: "Hadir",
                                  feedback: Icon(
                                    Icons.sick,
                                    size: 50,
                                    color: Colors.grey,
                                  )),
                              Icon(Icons.co_present),
                              Icon(Icons.co_present),
                              Icon(Icons.co_present),
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
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    // shape: ,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        "${users[index]['name']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      // contentPadding: EdgeInsets.all(5),
                      trailing: DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              boxShadow: [
                                //CSS: inset 0px 4px 6px rgba(8, 56, 73, 0.5)
                                BoxShadow(
                                  color: const Color.fromRGBO(
                                      8, 56, 73, 0.5), // shadow color
                                ),
                                const BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 6,
                                  color: Color(0xFFF9F8F9), // background color
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(''),
                          );
                        },
                        onAccept: (data) {
                          _isDropped = true;
                          print(data);
                          setState(() {});
                        },
                      ),
                      leading: CircleAvatar(

                          // child: Text("te"),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
