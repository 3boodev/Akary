import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSnackBar extends StatelessWidget {
  String os;
  AdaptiveSnackBar({required this.os});
  @override
  Widget build(BuildContext context) {
    if (os == 'ios') {
      return CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Icon(Icons.camera_alt), Text('Camera')],
            ),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Icon(Icons.image), Text('Gallery')],
            ),
            onPressed: () {},
          )
        ],
      );
    }
    return SnackBar(
      content: Column(
        children: [
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Icon(Icons.camera_alt), Text('Camera')],
            ),
            onTap: () {},
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Icon(Icons.image), Text('Gallery')],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
