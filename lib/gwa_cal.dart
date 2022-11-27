import 'package:flutter/material.dart';
import 'form_sample.dart';

class ButtonSample extends StatefulWidget {
  ButtonSample({super.key});

  @override
  _ButtonSampleState createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  List<String> hobbies = ["eating", "sleeping", "running", "drawing", "yoga"];
  int _currentIndex = 0;
  List<FormSample> formsList = [];

  void _addToList() {
    if (_currentIndex < 5) {
      setState(() {
        formsList.add(FormSample());
      });
      print(formsList[_currentIndex]);
      _currentIndex++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        OutlinedButton(
          onPressed: _addToList,
          child: Text("Add Subject"),
        ),
        Column(
          children: formsList,
        ),
        ElevatedButton(
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            // _formKey.currentState?.save();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    "Not",
                    // "Input Field: ${formValues['searchTerm']}\nCheckbox value: ${formValues['isChecked']}\nDropdown Value: ${formValues['dropdownValue']}",
                  ),
                );
              },
            );
          },
          // },
          child: const Text('Compute'),
        ),
      ],
    );
  }

  Row _buildHobbies(Widget label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label
        // const Icon(Icons.favorite_border),
        // Container(
        //   margin: const EdgeInsets.all(8),
        //   child: label,
        // ),
      ],
    );
  }
}
