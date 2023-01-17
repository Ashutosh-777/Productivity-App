import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_app/profilepage.dart';
import 'package:productivity_app/updatetask.dart';

class view_profile extends StatelessWidget {
  const view_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 19,
          ),
        )),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Username: ',
              style: GoogleFonts.comicNeue(fontSize: 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              username.text,
              style: GoogleFonts.shadowsIntoLight(fontSize: 19),
            ),
          ),
        ],
            ),
            Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Date of Birth: ',
              style: GoogleFonts.comicNeue(fontSize: 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dateofbirth.text,
              style: GoogleFonts.shadowsIntoLight(fontSize: 19),
            ),
          ),
        ],
            ),
            Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'About me: ',
              style: GoogleFonts.comicNeue(fontSize: 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description.text,
              style: GoogleFonts.shadowsIntoLight(fontSize: 19),
            ),
          ),
        ],
            ),
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'No. of tasks Completed: $counter ',
          style: GoogleFonts.comicNeue(fontSize: 19),
        ),
            ),
          ]),
      ),
    );
  }
}
