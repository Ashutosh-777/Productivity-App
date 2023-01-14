import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:productivity_app/signup_page.dart';
import 'animations.dart';
class Login_page extends StatelessWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Center(child: Text('Login into Your Account')),
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
                      //controller: emailAddress,
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
                      //controller: password,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: ()async{
                          },
                          child: const Text('Login',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (BuildContext context)=> const sign_up_page()),
                              );
                            },
                            child: const Text('Don\'t have an account?',
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
