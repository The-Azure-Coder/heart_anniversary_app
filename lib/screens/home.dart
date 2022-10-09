import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyhomePage();
}

class _MyhomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sparkle.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
              color: Colors.white.withOpacity(0.3),
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const Text(
                    'CELEBRATING',
                    style: TextStyle(
                        color: Colors.white, fontSize: 30, letterSpacing: 10),
                  ),
                  Image.asset(
                    'assets/images/HEART-Logo-40th.png',
                    height: 140,
                  ),
                  Image.asset(
                    'assets/images/stars.png',
                    height: 120,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 110,
                      ),
                      child: Text(
                        '4 decades of Providing Hope for a Nation',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  Row(
                    //THIS ROW HOLDS THE BUTTONS THAT WILL LEAD TO REGISTRATION OR LOGIN
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 100,
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: Text(
                      'Designed by:',
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  const Text('AMBERHEART institute of Coding - Cohort 2',
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600))
                ],
              ))),
    );
  }
}
