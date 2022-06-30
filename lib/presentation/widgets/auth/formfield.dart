import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/theme.dart';

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        Function()? onSubmit,
        Function()? onchange,
        bool isPassword = false,
        required Function validate,
        required String label,
        required IconData prefix,
        IconData? suffix,
        Function()? suffixpressed}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: GetStorage().read('isDarkTheme') == true
          ? Colors.white
          : Colors.black54,
      onFieldSubmitted: (value) => onSubmit,
      onChanged: (value) => onchange,
      validator: (value) => validate(value),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
        isDense: true,
        filled: true,
        fillColor: GetStorage().read('isDarkTheme') == true
            ? Colors.black26
            : Colors.white,
      ),
    );
/*

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFromField({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
*/
