import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/Add_taskpage.dart';
import 'package:productivity_app/get_quotes.dart';
import 'package:productivity_app/homepage_curved.dart';
import 'package:productivity_app/updatetask.dart';
import 'package:productivity_app/view_profile.dart';
import 'dart:math';
import 'dart:async';
import 'Task-model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_bar.dart';
// void main() async{
//   WidgetsFlutterBinding. ensureInitialized() ;
//   await Firebase.initializeApp () ;
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//       home: q_uotes(),
//   ));
// }

class q_uotes extends StatefulWidget {
  const q_uotes({Key? key}) : super(key: key);

  @override
  State<q_uotes> createState() => _q_uotesState();
}

class _q_uotesState extends State<q_uotes> {
  var _page = 0;

  @override
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      home: Scaffold(
        body: _page == 0
            ? homepage_curved()
            : _page == 1
                ? Add_task()
                : view_profile(),
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            print(index);
            setState(() {
              _page = index;
            });
          },
          items: const [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.add,
            ),
            Icon(
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}
