import 'package:akary/presentation/widgets/settings/profilewidget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: const [
          ProfileWidget(),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
