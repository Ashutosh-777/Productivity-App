import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/get_quotes.dart';
import 'package:productivity_app/profilepage.dart';
import 'package:productivity_app/updatetask.dart';
import 'dart:math';
import 'dart:async';
import 'Task-model.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage_curved extends StatefulWidget {
  const homepage_curved({Key? key}) : super(key: key);

  @override
  State<homepage_curved> createState() => _homepage_curvedState();
}

class _homepage_curvedState extends State<homepage_curved> {
  int _randomNumber = 2;
  Timer _timer = Timer(const Duration(seconds: 8), () {});
  var page = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      _generateRandomNumber();
    });
  }

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(1642) + 1;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Track Productivity',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: _w / 11,
                    width: _w - 16,
                    child: FutureBuilder(
                      future: get_Quotes.getQuotes(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          var quote = snapshot.data;
                          return SizedBox(
                            child: Text(
                              '${quote?[_randomNumber].text}',
                              maxLines: 3,
                            ),

                            // child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     shrinkWrap: true,
                            //     itemCount: 1,
                            //     itemBuilder: (context, index) {
                            //       index = _randomNumber;
                            //       return SizedBox(

                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               top: 8, bottom: 0, right: 10),
                            //           child: Text(
                            //             '${quote?[index].text}',
                            //             maxLines: 3,
                            //             style: TextStyle(
                            //                 fontSize: 19,
                            //                 color:
                            //                     Colors.black.withOpacity(.5)),
                            //           ),
                            //         ),
                            //       );
                            //     }),
                          );
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            value: null,
                            strokeWidth: 5.0,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                            semanticsLabel: 'Loading',
                          ));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: _w / 70,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: StreamBuilder(
                            stream: readtask(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return const Text('Error');
                              } else if (snapshot.hasData) {
                                return build_task(snapshot.data!);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//building task
Widget build_task(List<taskmodel> task) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: task.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(255, 175, 189, 1),
                Color.fromRGBO(255, 195, 160, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task[index].category,
                          style: GoogleFonts.poppins(fontSize: 22),
                        ),
                        IconButton(
                            onPressed: () {
                              Deletetask(task[index].ID);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      task[index].title.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Text(
                      task[index].description,
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 12, bottom: 4),
                        child: Text(
                          'DEADLINE :',
                          style: GoogleFonts.poppins(fontSize: 19),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 4),
                        child: Text(
                          task[index].deadline,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        update_task(task: task[index])),
                              );
                            },
                            icon: const Icon(Icons.edit)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Stream<List<taskmodel>> readtask() {
  return FirebaseFirestore.instance
      .collection(username.text)
      .snapshots()
      .map((snapshot) {
    print(snapshot);
    return snapshot.docs.map((doc) {
      return taskmodel.fromjson(doc.data());
    }).toList();
  });
}

Future Deletetask(id) async {
  final docUser = FirebaseFirestore.instance.collection(username.text).doc(id);
  await docUser.delete();
}
