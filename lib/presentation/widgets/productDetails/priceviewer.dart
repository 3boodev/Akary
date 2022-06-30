import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PriceViewer extends StatelessWidget {
  const PriceViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            text: "\t KWD 100",
            color: mainColor,
            underLine: TextDecoration.none),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade700.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'For Sale',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(Icons.visibility,
                color: GetStorage().read('isDarkTheme') == true
                    ? Colors.white
                    : Colors.grey.shade700),
            const SizedBox(
              width: 10,
            ),
            Text(
              '10',
              style: TextStyle(
                color: GetStorage().read('isDarkTheme') == true
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
