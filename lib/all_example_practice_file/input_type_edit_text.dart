import 'package:flutter/material.dart';

class MyInputTypePage extends StatefulWidget {
  @override
  _OEMFormState createState() => _OEMFormState();
}

class _OEMFormState extends State<MyInputTypePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OEM Form'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Rate *',
                  hintText: 'Enter rate',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a rate';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantity *',
                  hintText: 'Enter quantity',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Warranty Number',
                  hintText: 'Enter warranty number',
                ),
              ),
              DropdownButtonFormField<String>(
                value: 'Days',
                items: <String>['Days', 'Months', 'Years']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Warranty Period',
                ),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Delivery Date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Notes',
                  hintText: 'Enter notes',
                ),
                maxLines: null,
              ),
              SizedBox(height: 20),
              Text('Attachments'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                  IconButton(icon: Icon(Icons.video_call), onPressed: () {}),
                  IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                    }
                  },
                  child: Text('Submit'),
                ),
              ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "User name",
                      prefixIcon: Icon(Icons.person_add),
                      hintText: "Enter User Name"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      iconColor: Colors.lightBlue,
                      hintText: 'Enter PassWord'),
                  keyboardType: TextInputType.text,
                ),
              ),

              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'password',
                      icon: Icon(Icons.password),
                      hintText: 'Enter PassWord'),
                  keyboardType: TextInputType.text,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyImagePage()),
                  // );
                },
                child: const Text('Log in'),
              ),

            ],
          ),

      ],
          ),
        ),
      ),
    );
  }
}
