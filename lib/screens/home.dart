import 'package:flutter/material.dart';
import 'Registration.dart';
import 'login.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyhomePage();
}

class _MyhomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sparkle.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child:Container(
            color: Colors.white.withOpacity(0.3),
              width: 500,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/heart_logo.png',
                    height: 120,
                  ),
                  const Text(
                      'CELEBRATING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 10
                    ),
                  ),
                  Image.asset(
                    'assets/images/forty.png',
                    height: 180,
                  ),
                  Column(
                    children:  [
                      const Text(
                          'YEARS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 2
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: const [
                          Text(
                              'of',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: 3
                            )
                          ),
                          Text(
                              'Heart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23
                            )
                          )
                        ],
                      )
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 100,
                    ),
                      child:Text(
                          '4 decades of Providing Hope for a Nation',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  const Padding(padding: EdgeInsets.only(
                      top: 30
                    )
                  ),
                  Row(
                    //THIS ROW HOLDS THE BUTTONS THAT WILL LEAD TO REGISTRATION OR LOGIN
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Register()
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color:Colors.blue,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(25)
                              )
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 45,
                          ),
                          child: const Text(
                            'REGISTER',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Login()
                            ),
                          );
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            border: Border.all(
                              color: Colors.blue
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(25)
                            )
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 45,
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ],
              )
          )
      ),
    );
  }
}
