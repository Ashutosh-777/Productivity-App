

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity_app/Task-model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Add_task()));
}

//Add_task page
class Add_task extends StatelessWidget {
  //const Add_task({Key? key}) : super(key: key);
  TextEditingController dateCtl = TextEditingController();
  TextEditingController titlefortask = TextEditingController();
  TextEditingController descriptionfortask = TextEditingController();
  var category;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
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
                      'Create a new Task',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 380, top: 20),
                    child: Text(
                      'Title',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: titlefortask,
                      onTap: () {},
                      decoration: const InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 350, top: 20),
                    child: Text(
                      'Due Date',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: dateCtl,
                      decoration: const InputDecoration(
                        labelText: "Deadline",
                        hintText: "Deadline",
                      ),
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2100));

                        dateCtl.text = DateFormat("dd-MM-yyyy").format(date!);
                      },
                    ),
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top: 16, left: 8, right: 8),
              child: TextField(
                minLines: 1,
                maxLines: 3,
                controller: descriptionfortask,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Description",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 320, top: 20),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.width/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category='ACAEDMICS';
                              }, child: const Text('ACAEDMICS')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'CO-CURRICULAR';
                              },
                              child: const Text('CO-CURRICULAR')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'PERSONALITY';
                              }, child: const Text('PERSONALITY')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 22),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.width/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'SPORTS';
                              }, child: const Text('SPORTS')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'TECHNICAL';
                              },
                              child: const Text('TECHNICAL')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'MEDITATION';
                              }, child: const Text('MEDITATION')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 22),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.width/1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'GROCERIES';
                              }, child: const Text('GROCERIES')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'MARKET';
                              },
                              child: const Text('MARKET')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category= 'E-GAMING';
                              }, child: const Text('E-GAMING')),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 4,right: 4,top: 50),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(22),
                color:Colors.orange,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(0.0,0.75),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width-50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.white24,
                ),
                  onPressed: (){
                  CreateTask(taskmodel(
                      title: titlefortask.text,
                      category: category,
                      deadline: dateCtl.text,
                      description: descriptionfortask.text));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text('Create Task',
                    style: TextStyle(
                      fontSize: 28
                    ),
                    ),
                  )),
            ),
          )
        ],
      ),
          )),
    );
  }
}

Future CreateTask(taskmodel task) async {
  final docMessage = FirebaseFirestore.instance.collection('Tasks').doc();
  final task1 =task;
 final a = FirebaseFirestore.instance.collection('Tasks').orderBy('deadline',descending: true).snapshots();
 print(a);
  final json = task1.toJson();
  await docMessage.set(json);
}
