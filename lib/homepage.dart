import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/get_quotes.dart';
import 'dart:math';
import 'dart:async';
import 'Task-model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_bar.dart';
void main() async{
  WidgetsFlutterBinding. ensureInitialized() ;
  await Firebase.initializeApp () ;
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: q_uotes(),
  ));
}

class q_uotes extends StatefulWidget {
  const q_uotes({Key? key}) : super(key: key);

  @override
  State<q_uotes> createState() => _q_uotesState();
}

class _q_uotesState extends State<q_uotes> {
  @override
  Widget build(BuildContext context) {
    double _w =MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(_w/17, _w/20, 0, _w/10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('Track Productivity',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black.withOpacity(1),
                    ),
                    ),
                  ),
                  SizedBox(height: _w/8000,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,right: 50),
                    child: Text('Motivational Quotes Related to completion',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(height: _w/19,),
                  Container(
                    height: 500,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics().parent,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder(
                              stream: readtask(),
                              builder: (context,snapshot){
                                if(snapshot.hasError){
                                  print(snapshot.error);
                                  return const Text('Error');
                                }else if(snapshot.hasData){
                                  return build_task(snapshot.data!);
                                }else{
                                  return const Center(child:  CircularProgressIndicator());
                                }
                              }
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            )
          ],
        ),
       // bottomNavigationBar: ConvexBottombar(),
      ),
    );
  }
}
//building task
Widget build_task(List<taskmodel> task){
  return ListView.builder(
      shrinkWrap: true,
      itemCount: task.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 12),
          child: Container(
           width: MediaQuery.of(context).size.width-20,
            decoration: BoxDecoration(
                gradient:  const LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 175, 189, 1),
                    Color.fromRGBO(255, 195, 160, 1)
                  ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight
                ),
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
                        Text(task[index].category,
                        style: GoogleFonts.rubikWetPaint(
                          fontSize: 22
                        ),),
                        IconButton(
                            onPressed: (){
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 8),
                    child: Text(task[index].title.toUpperCase(),
                    style: GoogleFonts.gloriaHallelujah(
                        fontSize: 18,
                       fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 4),
                    child: Text(task[index].description,
                    style: GoogleFonts.shadowsIntoLight(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 12,bottom: 4),
                        child: Text('DEADLINE :',
                        style: GoogleFonts.rubikWetPaint(
                          fontSize: 19
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 4),
                        child: Text(task[index].deadline,
                        style: const TextStyle(
                          fontSize: 18
                        ),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/2.99,top: 8),
                        child: IconButton(
                            onPressed: (){

                            },
                            icon: const Icon(
                              Icons.edit
                            )),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        );
      }
  );
}
Stream<List<taskmodel>> readtask() {
  return FirebaseFirestore.instance.collection('Tasks').snapshots().map((snapshot) {
    print(snapshot);
    return snapshot.docs.map((doc) {
      return taskmodel.fromjson(doc.data());
    }).toList();
  });
}
Future Deletetsak(id) async{
  final docUser =FirebaseFirestore.instance.collection('Tasks').doc(id);
  await docUser.delete();
}











