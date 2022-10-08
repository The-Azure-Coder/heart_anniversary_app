import 'package:flutter/material.dart';
import 'login.dart';
import '../widgets/department_reg_dropDown.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/blur_login background.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 0.5,
                          offset: const Offset(0, 2))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white.withOpacity(0.6),
                  ),
                  width: 380,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/heart_logo.png',
                        height: 120,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 210,
                          child: const Text(
                            'Welcome To the HEART NSTA Registration System',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Phone NO.',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      SizedBox(
                          width: 350,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1.5,
                                    offset: const Offset(0, 2))
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: InputBorder.none,
                                  hintText: 'Organization',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400)),
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      const DropDown(),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 140,
                        ),
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20)),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
