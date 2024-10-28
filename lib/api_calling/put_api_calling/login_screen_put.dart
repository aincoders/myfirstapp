// email_screen.dart

import 'package:flutter/material.dart';

import 'login_dio_helper.dart';
import 'login_model.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String _message = '';
  List<UserModel> _emails = [];
  UserModel? email;

  @override
  void initState() {
    super.initState();
    _fetchEmails(); // Fetch initial data when screen loads
  }

  // Function to handle POST request and refresh GET data
  Future<void> _submitEmail() async {


    setState(() {
      _isLoading = true;
      _message = '';
    });

    final user = UserModel(email: _emailController.text);

    try {
      await _apiService.postUserEmail(user).then((result){
        if(result != null){
          if(result == 200){
            _fetchEmails();
          }
        }
      }); // POST request to submit email
      _emailController.clear();
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to handle GET request and update the list view
  Future<void> _fetchEmails() async {
    try {
      final emails = await _apiService.getUserEmails(); // GET request to fetch emails
      setState(() {
        _emails = emails;
      });
    } catch (e) {
      setState(() {
        _message = 'Error fetching emails: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Submission and Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email input form
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _submitEmail,
              child: Text(email != null ? 'Update Email' :'Submit Email'),
            ),
            const SizedBox(height: 16),
            Text(
              _message,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Expanded(
              child: _emails.isEmpty
                  ? const Center(child: Text('No emails found.'))
                  : ListView.builder(
                itemCount: _emails.length,
                itemBuilder: (context, index) {
                  email = _emails[index];
                  return ListTile(
                    title: Text(email?.email ?? ''),
                    trailing: IconButton(
                      onPressed: (){
                       setState(() {
                         _emailController.text = email?.email ?? '';
                       });
                      },
                      icon: Icon(Icons.edit),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
