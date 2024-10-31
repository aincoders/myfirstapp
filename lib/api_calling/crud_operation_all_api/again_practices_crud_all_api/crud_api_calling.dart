
import 'package:flutter/material.dart';
import 'package:myfirstapp/api_calling/crud_operation_all_api/again_practices_crud_all_api/crud_api_services_file.dart';

import 'crud_api_data_model.dart';

class CrudApiCalling extends StatefulWidget {
  const CrudApiCalling({super.key});

  @override
  State<CrudApiCalling> createState() => _CrudApiCallingState();
}

class _CrudApiCallingState extends State<CrudApiCalling> {
  List<CrudApiDataModel> _list = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final CrudApiServicesFile _apiService = CrudApiServicesFile();
  bool _isLoading = false;
  bool _isEditing = false;
  String _message = '';
  CrudApiDataModel? crudApiDataModel;

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
    if (crudApiDataModel?.user_id != null) {
      await _updateUserEmail(crudApiDataModel?.user_id, _nameController.text,_emailController.text, _phoneNoController.text,);
      crudApiDataModel = null; // Clear the userModel after update
      debugPrint("Update");
    } else {
      await _addNewUserEmail(_phoneNoController.text, _nameController.text, _emailController.text);
      debugPrint("ADD");
    }
    _isEditing = false; // Reset to add mode
     // Clear the text field after the operation
    _nameController.clear(); // Clear the text field after the operation
    _emailController.clear(); // Clear the text field after the operation
    _phoneNoController.clear(); // Clear the text field after the operation
    setState(() {
      _isLoading = false; // Reset loading state
    });
  }

  ///Post Api--->
  Future<void> _addNewUserEmail(String name, String email, String phoneNumber) async {
    try {
      final result = await _apiService.postUser( name, email, phoneNumber);
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
        _list = emails;
      });
    } catch (e) {
      setState(() {
        _message = 'Error fetching emails: $e';
      });
    }
  }

  ///Put(Update) Api--->
  Future<void> _updateUserEmail(int? user_id, String? user_name, String? user_email, String? user_phonenumber) async {
    try {
      final result = await _apiService.updateUserEmail(user_id, user_name,user_email, user_phonenumber);
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
          title: const Text('CRUD Api'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _phoneNoController,
                      decoration: InputDecoration(
                        labelText: 'Phone no*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _postUserEmail,
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            Expanded(
              child: _list.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator()) // Loading indicator
                  : ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        final item = _list[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('User id: ${item.user_id ?? ""}'),
                                        const SizedBox(height: 6),
                                        Text('Name: ${item.user_name ?? ""}'),
                                        const SizedBox(height: 6),
                                        Text('Email: ${item.user_email ?? ""}'),
                                        const SizedBox(height: 6),
                                        Text(
                                            'Phone no: ${item.user_phonenumber ?? ""}'),
                                        const SizedBox(height: 6),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _emailController.text =
                                          item.user_id.toString() ?? "";
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
                                    onPressed: () => _deleteUser(item.user_id),
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
        ));
  }
}
