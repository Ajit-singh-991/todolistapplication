import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todolistapplication/ApiConstants/constant_api.dart';

import '../providers/task.dart';

//Show a bottom sheet that allows the user to create or edit a task.
//### MISSING FEATURES ###
// Proper Form Focus and keyboard actions.
// BottomModalSheet size is too big and doesn't work proper with keyboard.
// Keyboard must push the sheet up so the "ADD TASK" button is visible.

class AddNewTask extends StatefulWidget {
  final String id;
  final bool isEditMode;

  const AddNewTask({
    super.key,
    required this.isEditMode,
    required this.id,
  });

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _accountNumController = TextEditingController();
  final _adharNumController = TextEditingController();
  final _naaameController = TextEditingController();
  final _panNumController = TextEditingController();
  late Task task;
  String _adhar = "";
  String _account = "";
  String _pan = "";
  String _name = "";
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _accountNumController.dispose();
    _adharNumController.dispose();
    _naaameController.dispose();
    _panNumController.dispose();
    super.dispose();
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (!widget.isEditMode) {
        Provider.of<TaskProvider>(context, listen: false).createNewTask(
          Task(
              id: DateTime.now().toString(),
              adharCardNumber: _adharNumController.text,
              accountNumber: _accountNumController.text,
              panNumber: _panNumController.text,
              name: _naaameController.text),
        );
      } else {
        Provider.of<TaskProvider>(context, listen: false).editTask(
          Task(
              id: task.id,
              adharCardNumber: _adharNumController.text,
              accountNumber: _accountNumController.text,
              panNumber: _panNumController.text,
              name: _naaameController.text),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    if (widget.isEditMode) {
      task =
          Provider.of<TaskProvider>(context, listen: false).getById(widget.id);

      _adharNumController.text = task.adharCardNumber;
      _accountNumController.text = task.accountNumber;
      _panNumController.text = task.panNumber;
      _naaameController.text = task.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.30),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Container(
              alignment: Alignment.bottomRight,
              color: Colors.white,
              height: 600,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('AdharCard Number',
                        style: Theme.of(context).textTheme.titleMedium),
                    TextFormField(
                      controller: _adharNumController,
                      // initialValue: _adhar == null ? null : _adhar,
                      decoration: const InputDecoration(
                          hintText: 'AdharCard Number',
                          hintStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Correct number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _adhar = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Account Number',
                        style: Theme.of(context).textTheme.titleMedium),
                    TextFormField(
                      controller: _accountNumController,
                      // initialValue: _account == null ? null : _account,
                      decoration: const InputDecoration(
                          hintText: 'Account Number',
                          hintStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Correct number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _account = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('PanCard Number',
                        style: Theme.of(context).textTheme.titleMedium),
                    TextFormField(
                      controller: _panNumController,
                      // initialValue: _pan == null ? null : _pan,
                      decoration: const InputDecoration(
                          hintText: 'PanCard Number',
                          hintStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Correct number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _pan = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Name',
                        style: Theme.of(context).textTheme.titleMedium),
                    TextFormField(
                      controller: _naaameController,
                      // initialValue: _name == null ? null : _name,
                      decoration: const InputDecoration(
                          hintText: 'Name', hintStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Correct number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        child: Text(
                          !widget.isEditMode ? 'ADD TASK' : 'EDIT TASK',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          log("================>>>>${_accountNumController.text}");
                          try {
                            await ApiBaseUrl().updateData(
                              accountNum: _accountNumController.text,
                              adharNum: _adharNumController.text,
                              panNum: _panNumController.text,
                              naaame: _naaameController.text,
                            );
                            _validateForm();
                            const snackBar = SnackBar(
                              content: Text('Hey! Data Updated.'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } catch (e) {
                            print('Error updating data: $e');
                            // Handle the error as needed
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
