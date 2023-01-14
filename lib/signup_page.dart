import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'animations.dart';
import 'loginpage.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({Key? key}) : super(key: key);

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xff437BFF),
        title: const Center(child: Text('Register yourself')),
      ),
      body: Stack(
        children: [
          CircularParticleScreen2(),
          Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                children: [
                  const Image(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/1314544/pexels-photo-1314544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, right: 220),
                    child: Text(
                      'Email Address',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: TextField(
                      cursorColor: Colors.grey,
                      cursorHeight: 24,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        filled: true,
                        fillColor: Color(0xff437BFF),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color:Color(0xff437BFF),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      controller: emailAddress,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, right: 254),
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: TextField(
                      cursorColor: Colors.grey,
                      cursorHeight: 24,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        filled: true,
                        fillColor: const Color(0xff437BFF),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color:Color(0xff437BFF),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      controller: password,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: ()async{
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailAddress.text,
                                  password: password.text,
                                );
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(builder: (BuildContext context)=> const Login_page()),
                                // );
                              } on FirebaseAuthException catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: Text(e.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: Text(e.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                            },
                            child: const Text('Sign-up',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (BuildContext context)=> const Login_page()),
                              );
                            },
                            child: const Text('Already have an account?',
                              style: TextStyle(
                                fontSize: 18,
                                //color: Color(0xff437BFF),

                              ),
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

