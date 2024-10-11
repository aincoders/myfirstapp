import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:myfirstapp/part_requisition/main_home_part_requisition/main_home_PartRequisition.dart';

class TaxInformation extends StatefulWidget {
  const TaxInformation({super.key});

  @override
  State<TaxInformation> createState() => _TaxInformationState();
}

class _TaxInformationState extends State<TaxInformation> {
  bool isSwitched = false;
  bool _isCheckbox1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Expanded(
                            child: Text(
                                "Is your business are registered for GST ?",
                              style: Theme.of(context).textTheme.bodyMedium ,
                            ),
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeTrackColor: Colors.orange,
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'GST identification Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _isCheckbox1,
                            onChanged: (value) {
                              setState(() {
                                _isCheckbox1 = value!;
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                           Expanded(
                              child: Text(
                                  "My Business Is Registered For Composition Scheme",
                                style: Theme.of(context).textTheme.bodyMedium ,

                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Default Tax Percentage',
                          suffixIcon: const Icon(Symbols.arrow_drop_down),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainHomePartRequisition()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text("Save detail"),
              ),
            ),
            const SizedBox(
              height: 72,
            )
          ],
        ),
      ),
    );
  }
}
