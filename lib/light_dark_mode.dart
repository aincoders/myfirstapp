import 'package:flutter/material.dart';


class MyLightDarkMode extends StatefulWidget {
  const MyLightDarkMode({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyLightDarkMode> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Flutter Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Hello World',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Button action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set the button color to green
                ),
                child: const Text('Click Me',style: TextStyle(color: Colors.red),),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/avatar-1.png', // Replace with your image asset path
                height: 100,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = false;
                  });
                },
                child: const Text('Light Mode'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = true;
                  });
                },
                child: const Text('Dark Mode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
