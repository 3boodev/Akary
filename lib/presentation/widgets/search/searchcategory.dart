import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({Key? key}) : super(key: key);

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  final List<String> _categories = [
    'Flat',
    'Villa',
    'Field',
    'Block'
  ]; // Option 2
  String? _selectedCategory;
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
    );
  }
}
