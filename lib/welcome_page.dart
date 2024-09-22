import 'package:flutter/material.dart';
import 'package:homework/login.dart';
import 'package:homework/sign_up.dart';
import 'SlideRight.dart';

class welcome extends StatefulWidget {
  State<welcome> createState() => _welcome1();
}

class _welcome1 extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "images/222.jpg",
              ),
              fit: BoxFit.fill,
            )),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 150,
                      height: 240,
                      child: Image.asset(
                        "images/0000.png",
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Welcome to",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: Colors.white),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("MedStop",
                                    style: TextStyle(
                                        fontSize: 60,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.pink[200])),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 120,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                              height: 40,
                              minWidth: 300,
                              shape: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(SlideRight(Page: login()));
                              },
                              child: const Text("Login",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(height: 15),
                            MaterialButton(
                              height: 40,
                              minWidth: 300,
                              shape: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(SlideRight(Page: signup()));
                              },
                              child: const Text("SignUp",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ])));
  }
}
