import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/all_login_screes/verification_otp.dart';
import 'package:myfirstapp/whatsapp/error_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        splashColor: Colors.transparent,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.close_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset("assets/images/logo_part_requisition.png"),
            Container(
              margin: const EdgeInsets.only(top: 32),
              padding: const EdgeInsets.symmetric(horizontal: 52),
              child: Text(
                "Enter Email Address to continue",
                style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold) ,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "We Will send you the ",
                    style: Theme.of(context).textTheme.bodyMedium ,
                    // Default text style
                    children: [
                      TextSpan(
                        text: "6 digit ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold) ,
                      ),
                      TextSpan(text: "verification code ",
                        style: Theme.of(context).textTheme.bodyMedium ,
                      )
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 24),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email Address *"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    text:
                        "Don’t worry your data will not be shared with anyone. Please read our ",
                    children: [
                      TextSpan(
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                          text: "Terms of Service "),
                      TextSpan(text: "and "),
                      TextSpan(
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                          text: "Privacy Policy ")
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 52),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerificationOtp()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text("GET OTP"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: RichText(
                text: TextSpan(
                    text: 'Not an Account? ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Create Account',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.orange),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MyErrorPage()));
                            })
                    ]),
              ),
            ),
            const SizedBox(height: 72)
          ],
        )),
      ),
    );
  }
}
