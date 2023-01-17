import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class get_Quotes {
  static Future<List<dynamic>> getQuotes() async {
    var uri = Uri.parse('https://type.fit/api/quotes');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    List<Quotes> abc = [];

    for (int i = 0; i < body.length; i++) {
      // print(body[i]['text']);
      abc.add(Quotes(text: body[i]['text']));
    }
    return abc;
  }
}




//Getting quotes obtained from API
// class obtaining_quotes extends StatefulWidget {
//   const obtaining_quotes({Key? key}) : super(key: key);
//   @override
//   State<obtaining_quotes> createState() => _obtaining_quotesState();
// }
//
// class _obtaining_quotesState extends State<obtaining_quotes> {
//   int _randomNumber=2;
//   Timer _timer=Timer(const Duration(seconds: 8), () { });
//
//   @override
//   void initState() {
//     super.initState();
//     _generateRandomNumber();
//     _timer = Timer.periodic(const Duration(seconds: 8), (_) {
//       _generateRandomNumber();
//     });
//   }
//   void _generateRandomNumber() {
//     setState(() {
//       _randomNumber = Random().nextInt(1642) + 1;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: get_Quotes.getQuotes(),
//       builder: (context,snapshot){
//         if(snapshot.hasError){
//           return const Text('Error');
//         }else if(snapshot.hasData){
//           final quote=snapshot.data;
//           return ListView.builder(
//             itemCount: 1,
//             itemBuilder: (BuildContext context, int index) {
//               index=_randomNumber;
//               return Padding(
//                 padding: const EdgeInsets.only(right: 50,top: 0),
//                 child: ListTile(
//                   tileColor: Colors.transparent,
//                   title: Text(
//                     quote?[index].text,
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 19
//                     ),
//                   ),
//
//                 ),
//               );
//             },
//           );
//         }else{
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }