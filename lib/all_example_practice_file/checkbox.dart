import 'package:flutter/material.dart';



class MyCheckBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckboxExample(),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkbox1,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkbox1 = value!;
                    });
                  },
                ),
                Text('Checkbox 1'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkbox2,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkbox2 = value!;
                    });
                  },
                ),
                Text('Checkbox 2'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkbox3,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkbox3 = value!;
                    });
                  },
                ),
                Text('Checkbox 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
