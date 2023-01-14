import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:productivity_app/signup_page.dart';
import 'firebase_options.dart';
import 'package:particles_flutter/particles_flutter.dart';
void main () async {
  WidgetsFlutterBinding. ensureInitialized() ;
  await Firebase.initializeApp () ;
  runApp (const mainpage()) ;

}
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: sign_up_page(),

    );
  }
}



