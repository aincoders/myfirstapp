import 'package:flutter/material.dart';

class MyErrorPage extends StatelessWidget{
  const MyErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Error"),
     ),
     body: Center(
       child: Image.asset("assets/images/error_page_404.png"),
     ),
   );
  }
}