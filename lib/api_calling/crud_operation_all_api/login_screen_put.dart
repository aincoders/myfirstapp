import 'package:flutter/material.dart';

import 'login_dio_helper.dart';
import 'login_model.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool _isEditing = false;
  String _message = '';
  List<UserModel> _emails = [];
  UserModel? userModel;

  ///init state--->
  @override
  void initState() {
    super.initState();
    _getUserEmails();
    debugPrint("get---->>---calling");
  }

  Future<void> _postUserEmail() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });
    if (_isEditing && userModel?.id != null) {
      await _updateUserEmail(userModel?.id, _emailController.text);
      userModel = null; // Clear the userModel after update
      debugPrint("Update");
    } else {
      await _addNewUserEmail(_emailController.text);
      debugPrint("ADD");
    }
    _isEditing = false; // Reset to add mode
    _emailController.clear(); // Clear the text field after the operation
    setState(() {
      _isLoading = false; // Reset loading state
    });
  }

  ///Post Api--->
  Future<void> _addNewUserEmail(String? email) async {
    try {
      final result = await _apiService.postUserEmail(email);
      if (result != null && result == 200) {
        _getUserEmails();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email added successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add email.')),
        );
      }
    } catch (e) {
      setState(() {
        _message = 'Error adding email: $e';
      });
    }
  }

  ///Get Api--->
  Future<void> _getUserEmails() async {
    try {
      final emails = await _apiService.getUserItem();
      debugPrint('Fetched emails: $emails');
      setState(() {
        _emails = emails;
      });
    } catch (e) {
      setState(() {
        _message = 'Error fetching emails: $e';
      });
    }
  }

  ///Put(Update) Api--->
  Future<void> _updateUserEmail(int? id, String? email) async {
    try {
      final result = await _apiService.updateUserEmail(id, email);
      if (result != null && result == 200) {
        _getUserEmails();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email updated successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update email.')),
        );
      }
    } catch (e) {
      setState(() {
        _message = 'Error updating email: $e';
      });
    }
  }

  ///Delete Api--->
  Future<void> _deleteUser(int? userId) async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User ID is null. Cannot delete email.")),
      );
      return;
    }
    try {
      await _apiService.deleteUserEmail(userId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User email deleted successfully.")),
      );
      _getUserEmails();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting email: $e")),
      );
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
                    onPressed: _postUserEmail,
                    child: Text(_isEditing == true ? 'Update Email' : 'Submit Email'),
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
                        final item = _emails[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text(item.id?.toString() ?? 'No ID'),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(item.email ?? "No Email"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _emailController.text = item.email ?? "";
                                      userModel = item;
                                      setState(() {
                                        _isEditing = true; // Set edit mode
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _deleteUser(item.id),
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
