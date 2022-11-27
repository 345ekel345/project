import 'package:flutter/material.dart';
import 'dart:convert';

class FormSample extends StatefulWidget {
  FormSample({super.key});

  @override
  _InputFieldsSampleState createState() => _InputFieldsSampleState();
}

int getFormvalues(formValues) {
  int unit = formValues['units'];
  int grade = formValues['dropdownValue'];
  return 2;
}

class _InputFieldsSampleState extends State<FormSample> {
  static final List<String> _dropdownOptions = [
    "1",
    "1.25",
    "1.5",
    "1.75",
    "2",
    "2.25",
    "2.5",
    "2.75",
    "3",
    "5"
  ];

  Map<String, dynamic> formValues = {
    'units': "",
    'subject': "",
    'dropdownValue': _dropdownOptions.first,
  };

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              // Text Field
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter subject",
                  labelText: "Enter Subject",
                ),
                onChanged: ((String? value) {
                  formValues['subject'] = value;
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject';
                  }
                  return null;
                },
              ),

              // Dropdown
              FormField(
                builder: (FormFieldState<String> state) {
                  return DropdownButton<String>(
                    value: formValues['dropdownValue'],
                    onChanged: (String? value) {
                      setState(() {
                        formValues['dropdownValue'] = value!;
                        print(value);
                      });
                    },
                    items: _dropdownOptions.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  );
                },
                onSaved: ((String? value) {
                  formValues['dropdownValue'] = value!;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Units",
                  labelText: "Enter Units",
                ),
                onChanged: ((String? value) {
                  formValues['units'] = value;
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter units';
                  }
                  if (int.parse(value) < 0 || int.parse(value) > 6) {
                    return 'Please input from 1 to 5';
                  }
                  print("out");
                  return null;
                },
              ),

              // Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // _formKey.currentState?.save();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Input Field: ${formValues['subject']}\nUnits value: ${formValues['units']}\nDropdown Value: ${formValues['dropdownValue']}",
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text('Show text'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
