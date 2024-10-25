import 'package:flutter/material.dart';
import "package:pin_code_fields/pin_code_fields.dart";



class MyOtpPage extends StatelessWidget {
  const MyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PIN Input')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PinInputExample(),
        ),
      ),
    );
  }
}

class PinInputExample extends StatefulWidget {
  @override
  _PinInputExampleState createState() => _PinInputExampleState();
}

class _PinInputExampleState extends State<PinInputExample> {
  TextEditingController _pinController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PinCodeTextField(
          appContext: context,
          length: 4, // Set the number of PIN digits
          obscureText: true, // To hide the input text
          obscuringCharacter: '*', // Custom character to obscure text
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.blue.shade50,
          enableActiveFill: true,
          controller: _pinController,
          onCompleted: (v) {
            print("Completed: $v"); // Handle PIN submission
          },
          onChanged: (value) {
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            // Allows pasting into the PIN fields
            return true;
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            print("Entered PIN: ${_pinController.text}");
          },
          child: Text('Submit PIN'),
        ),
      ],
    );
  }
}
