import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget{
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card View"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.lightGreenAccent,
            elevation: 16.0, shadowColor: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const ListTile(
                  leading: Icon(Icons.contacts_sharp, size: 60,),
                  title: Text(
                    'Ali Sajid',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      wordSpacing: 2.0,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),

            subtitle: Text("Palsaniya", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),),
                ),
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("Next"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}