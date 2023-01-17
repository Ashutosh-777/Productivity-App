import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity_app/Task-model.dart';
import 'package:productivity_app/profilepage.dart';

var counter = 0;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: update_task()));
// }

//Add_task page
class update_task extends StatefulWidget {
  final taskmodel task;
  update_task({required this.task});
  @override
  State<update_task> createState() => _update_taskState();
}

class _update_taskState extends State<update_task> {
  //const Add_task({Key? key}) : super(key: key);
  TextEditingController dateCtl = TextEditingController();

  TextEditingController descriptionfortask = TextEditingController();
  var title_update = '';
  var deadline_update = '';
  var category_update;
  bool iscompleted_update = false;
  var description_update = '';

  bool iscompleted = false;
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
              // height: MediaQuery.of(context).size.height / 2.4,
              //height: MediaQuery.of(context).size.height/2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 90,
                      right: 220,
                    ),
                    child: Text(
                      'Edit Task',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Title',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => {
                        title_update = value,
                      },
                      initialValue: widget.task.title,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Due Date',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: widget.task.deadline,
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

                        deadline_update =
                            DateFormat("dd-MM-yyyy").format(date!);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 8, right: 8),
              child: TextFormField(
                initialValue: widget.task.description,
                minLines: 1,
                maxLines: 3,
                onChanged: (value) {
                  description_update = value;
                },
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
                                category_update = 'ACAEDMICS';
                              },
                              child: const Text('ACAEDMICS')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'CO-CURRICULAR';
                              },
                              child: const Text('CO-CURRICULAR')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'PERSONALITY';
                              },
                              child: const Text('PERSONALITY')),
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
                                category_update = 'SPORTS';
                              },
                              child: const Text('SPORTS')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'TECHNICAL';
                              },
                              child: const Text('TECHNICAL')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'MEDITATION';
                              },
                              child: const Text('MEDITATION')),
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
                                category_update = 'GROCERIES';
                              },
                              child: const Text('GROCERIES')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'MARKET';
                              },
                              child: const Text('MARKET')),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                category_update = 'E-GAMING';
                              },
                              child: const Text('E-GAMING')),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Mark as completed'),
                      Checkbox(
                        value: iscompleted_update,
                        onChanged: (value) {
                          setState(() {
                            iscompleted_update = value!;
                          });
                        },
                      ),
                    ],
                  )
                ],
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
                      category_update ??= widget.task.category;
                      title_update ??= widget.task.title;
                      description_update ??= widget.task.description;
                      deadline_update;
                      Updatetask(taskmodel(
                          title: title_update,
                          category: category_update,
                          deadline: deadline_update,
                          description: description_update,
                          ID: widget.task.ID,
                          iscompleted: iscompleted_update));
                      if (iscompleted == true) {
                        Deletetask(widget.task.ID);
                      }
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'Update Task',
                        style: TextStyle(fontSize: 28),
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

Future Updatetask(taskmodel task) async {
  print(task.ID);
  final docUser =
      FirebaseFirestore.instance.collection(username.text).doc(task.ID);
  final json = task.toJson();
  await docUser.update(json);
}

Future Deletetask(id) async {
  final docUser = FirebaseFirestore.instance.collection(username.text).doc(id);
  await docUser.delete();
}
