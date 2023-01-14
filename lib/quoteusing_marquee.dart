import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'get_quotes.dart';
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height/24,
                  child: Marquee(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      scrollAxis: Axis.horizontal,
                      text: quote?[index].text,
                      fadingEdgeEndFraction: 0.1,
                      fadingEdgeStartFraction: 0.1,
                      blankSpace: 20,
                      velocity: MediaQuery.of(context).size.width/5,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xff437BFF),
                      )
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
