import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/part_requisition/setting/main_setting_part_requisition.dart';
import 'package:pinput/pinput.dart';

import '../../whatsapp/error_page.dart';

class VerificationOtp extends StatefulWidget {
  const VerificationOtp({super.key});

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
    );

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
                "OTP Verification",
                style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold) ,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the OTP sent to ",
                        style: Theme.of(context).textTheme.bodyMedium ,
                        // Default text style
                        children: [
                          TextSpan(
                            text: "shabbirh@-----",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold) ,
                          ),
                        ]),
                  ),
                ),
                const Icon(Icons.edit, size: 18),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 24),
              child: Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusNode: FocusNode(),
                controller: TextEditingController(),
                showCursor: true,
                preFilledWidget: const Center(
                  child: Text(
                    '--', // Use any character as a hint (e.g., '*')
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t receive OTP ? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend 59s',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.orange) ,
                      )
                    ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text:
                        "Don’t worry your data will not be shared with anyone. Please read our ",
                    children: [
                      TextSpan(
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MyErrorPage()));
                            },
                          text: "Terms of Service "),
                      const TextSpan(text: "and "),
                      const TextSpan(
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
                      builder: (context) =>
                          const MainSettingPartRequisition()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text('Verify & Continue'),
              ),
            ),
            const SizedBox(height: 72)
          ],
        )),
      ),
    );
  }
}
