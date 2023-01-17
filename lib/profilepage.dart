import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity_app/homepage.dart';


TextEditingController username = TextEditingController();
TextEditingController dateofbirth = TextEditingController();
TextEditingController description = TextEditingController();

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange,
                borderRadius: BorderRadius.circular(14)),
            // width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 2.4,
            //height: MediaQuery.of(context).size.height/2.8,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 90,
                    right: 120,
                  ),
                  child: Text(
                    'Profile Details',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 330, top: 20),
                  child: Text(
                    'Username',
                    style: TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    onTap: () {},
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 300, top: 20),
                  child: Text(
                    'Date of Birth',
                    style: TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dateofbirth,
                    decoration: const InputDecoration(
                      labelText: "DOB",
                      hintText: "Enteer your date of Birth",
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1947),
                          lastDate: DateTime(2100));

                      dateofbirth.text = DateFormat("dd-MM-yyyy").format(date!);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: TextField(
              minLines: 1,
              maxLines: 3,
              controller: description,
              decoration: const InputDecoration(
                labelText: "About me",
                hintText: "Write something to describe yourself",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4, top: 50),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(22),
                color: Colors.orange,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(0.0, 0.75),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width - 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    shadowColor: Colors.white24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const q_uotes()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Save profile',
                      style: TextStyle(fontSize: 28),
                    ),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
