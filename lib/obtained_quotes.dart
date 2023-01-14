import 'package:flutter/material.dart';
import 'package:productivity_app/get_quotes.dart';
import 'dart:math';
import 'dart:async';
class obtaining_quotes extends StatefulWidget {
  const obtaining_quotes({Key? key}) : super(key: key);
  @override
  State<obtaining_quotes> createState() => _obtaining_quotesState();
}

class _obtaining_quotesState extends State<obtaining_quotes> {
  int _randomNumber=2;
  Timer _timer=Timer(const Duration(seconds: 8), () { });

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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_Quotes.getQuotes(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }else if(snapshot.hasData){
          final quote=snapshot.data;
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              index=_randomNumber;
              return ListTile(
                tileColor: Colors.white,
                title: Text(
                  quote?[index].text,
                  style: TextStyle(
                      color: Color(0xff437BFF)
                  ),
                ),

              );
            },
          );
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}