import 'package:flutter/material.dart';

class MyRowColumnColourPage extends StatelessWidget {
  const MyRowColumnColourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Row Column Colour Page"),
      ),
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.lightGreenAccent,
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    color: Colors.yellow,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.lightBlue,
                  ))
                ],
              )),
              Expanded(
                  child: Container(
                color: Colors.pinkAccent,
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.lightBlue,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.yellow,
                  ))
                ],
              ))
            ],
          )),

          ///////////

          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.purple,
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.greenAccent,
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.brown,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.green,
                          )),
                        ],
                      )),
                      Expanded(
                          child: Container(
                        color: Colors.yellow,
                      )),
                    ],
                  ))
                ],
              )),
              Expanded(
                  child: Container(
                color: Colors.blue,
              )),
            ],
          )),
        ],
      ),
    );
  }
}
