import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/main/addnewakar.dart';
import 'package:akary/presentation/screens/products/productsdetailscreen.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/presentation/widgets/home/carouselslider.dart';
import 'package:akary/presentation/widgets/products/productcard.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CarouselSliderWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: TextUtils(
                  color: GetStorage().read('isDarkTheme') == true
                      ? Colors.white
                      : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: "Products",
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ProductCard(1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GetStorage().read('isDarkTheme') == true
            ? Colors.black.withOpacity(0.9)
            : statusBarColor,
        onPressed: () {
          navigateTo(context, AddNewAkar());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: GetStorage().read('isDarkTheme') == true
              ? Colors.white
              : Colors.black,
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
