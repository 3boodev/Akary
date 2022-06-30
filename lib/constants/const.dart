import 'dart:io';

import 'package:akary/presentation/screens/auth/login/loginscreen.dart';
import 'package:akary/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

String getOs() {
  return Platform.operatingSystem;
}

String token = '';
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

void Logout(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateToAndFinish(context, LoginScreen());
    }
  });
}
