import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/all_login_screes/login.dart';

class SignupPassword extends StatefulWidget {
  const SignupPassword({super.key});

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //         icon: const Icon(Icons.close_outlined))
      //   ],
      // ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        splashColor: Colors.transparent,
        highlightElevation:0,
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
              child:  Text(
                "Sign Up with Email",
                style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold) ,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(top: 16),
              child:  Text(
                "Take charge of your workshop management with ease and experience the benefits of DMS today.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium ,
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                "We have sent you a verification code to your email address. Please enter code below to verify your account:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium ,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 24),
              child:  Text(
                "Resend OTP",
                 style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.orange)
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 24),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verification Code *"),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 52),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text("Complete Sign up"),
              ),
            ),
            const SizedBox(height: 72),
          ],
        )),
      ),
    );
  }
}
