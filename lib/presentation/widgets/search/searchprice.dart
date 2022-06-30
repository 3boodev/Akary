import 'package:akary/presentation/widgets/auth/formfield.dart';
import 'package:flutter/material.dart';

class SearchPrice extends StatelessWidget {
  SearchPrice({Key? key}) : super(key: key);
  var priceFrom = TextEditingController();
  var priceTo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          defaultFormField(
              controller: priceFrom,
              label: 'Price From',
              type: TextInputType.number,
              validate: (String value) {
                if (value.isEmpty) {
                  return 'Price Must be greater than 20000 Pound ';
                }
              },
              prefix: Icons.price_change_outlined),
          const SizedBox(
            height: 10,
          ),
          defaultFormField(
              controller: priceTo,
              label: 'Price To',
              type: TextInputType.number,
              validate: (String value) {
                if (value.isEmpty) {
                  return 'Price Must be greater than 20000 Pound ';
                }
              },
              prefix: Icons.price_change_outlined),
        ],
      ),
    );
  }
}
