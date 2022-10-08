import 'package:flutter/material.dart';
import 'Registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/blur_login background.jpg'),
                fit: BoxFit.cover
            )
        ),
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
                        offset: const Offset(0,2)
                    )
                  ],
                  borderRadius: const BorderRadius.all(
                      Radius.circular(20)
                  ),
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
                    const Text(
                      'Hello Again!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            bottom: 20,
                            top: 20
                        ),
                        width:210,
                        child:const Text(
                          "Welcome back you've been missed!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10
                        )
                    ),
                    SizedBox(
                        width:350,
                        child:Container(
                          decoration:  BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1.5,
                                  offset: const Offset(0,2)
                              )
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child:TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15
                                ),
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400
                                )
                            ),
                          ),
                        )
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10
                        )
                    ),
                    SizedBox(
                        width:350,
                        child:Container(
                          decoration:  BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1.5,
                                  offset: const Offset(0,2)
                              )
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child:TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15
                                ),
                                border: InputBorder.none,
                                hintText: 'Department',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400
                                )
                            ),
                          ),
                        )
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color:Colors.blue,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 140,
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5
                            )
                        ),
                        GestureDetector(
                          onTap:() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Register()
                              ),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}