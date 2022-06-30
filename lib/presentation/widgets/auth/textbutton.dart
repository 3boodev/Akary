import 'package:akary/constants/theme.dart';
import 'package:flutter/material.dart';

Widget defaultTextButton(
        {required Function() onpress,
        required String text,
        required Color textColor}) =>
    TextButton(
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
      ),
    );
