import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/presentation/widgets/home/carouselslider.dart';
import 'package:akary/presentation/widgets/productDetails/imageslider.dart';
import 'package:akary/presentation/widgets/productDetails/moredetails.dart';
import 'package:akary/presentation/widgets/productDetails/priceviewer.dart';
import 'package:akary/presentation/widgets/products/productcard.dart';
import 'package:flutter/material.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            ImageSlider(),
            SizedBox(
              height: 10,
            ),
            PriceViewer(),
            SizedBox(
              height: 20,
            ),
            MoreDetails(),
          ]),
        ),
      ),
    );
  }
}
