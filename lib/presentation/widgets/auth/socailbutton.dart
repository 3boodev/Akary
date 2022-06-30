import 'package:akary/constants/theme.dart';
import 'package:flutter/material.dart';

Widget socialButton({
  required Function() onpress,
  required String image,
}) =>
    InkWell(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          image,
        ),
      ),
    );
