import 'package:flutter/material.dart';

class AddAkarOption extends StatefulWidget {
  const AddAkarOption({Key? key}) : super(key: key);

  @override
  State<AddAkarOption> createState() => _AddAkarOptionState();
}

class _AddAkarOptionState extends State<AddAkarOption> {
  final List<String> _categories = ['Flat', 'Villa', 'Field', 'Block'];
  String? _selectedCategory;
  final List<String> _process = ['For Sale', 'For Rent'];
  String? _selectedProcess;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey)),
          child: DropdownButton(
            isExpanded: true,
            hint: const Text(
                'Please choose Category'), // Not necessary for Option 1
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue as String?;
              });
            },
            items: _categories.map((location) {
              return DropdownMenuItem(
                child: Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey)),
          child: DropdownButton(
            isExpanded: true,
            hint: const Text(
                'Please choose Process'), // Not necessary for Option 1
            value: _selectedProcess,
            onChanged: (newValue) {
              setState(() {
                _selectedProcess = newValue as String?;
              });
            },
            items: _process.map((process) {
              return DropdownMenuItem(
                child: Text(process),
                value: process,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
