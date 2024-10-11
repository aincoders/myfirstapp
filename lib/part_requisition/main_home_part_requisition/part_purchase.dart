import 'package:flutter/material.dart';

class PartPurchase extends StatefulWidget {
  const PartPurchase({super.key});

  @override
  State<PartPurchase> createState() => _PartPurchaseState();
}

class _PartPurchaseState extends State<PartPurchase> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Part Purchase"),
      ),
    );  }
}
