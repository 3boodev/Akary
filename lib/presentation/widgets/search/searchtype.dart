import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SearchType extends StatefulWidget {
  const SearchType({Key? key}) : super(key: key);

  @override
  State<SearchType> createState() => _SearchTypeState();
}

class _SearchTypeState extends State<SearchType> {
  final List<String> _locations = ['For Sale', 'For Rent']; // Option 2
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: GetStorage().read('isDarkTheme') == true
                  ? Colors.white60
                  : Colors.grey.shade800,
            )),
        child: DropdownButton(
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: GetStorage().read('isDarkTheme') == true
                ? Colors.white
                : Colors.black,
          ),
          hint:
              const Text('Please choose a Type'), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue as String?;
            });
          },
          items: _locations.map((location) {
            return DropdownMenuItem(
              child: Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }
}
