import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/products/productsdetailscreen.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class ProductCard extends StatefulWidget {
  ProductCard(this.index);
  int index;
  @override
  State<ProductCard> createState() => _ProductCardState(index);
}

class _ProductCardState extends State<ProductCard> {
  _ProductCardState(this.index);
  int index;
  List<dynamic> productsList = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/products.json');
    final data = await json.decode(response);

    setState(() {
      productsList = data['products'];
      //.map((data) => PlayersModel.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: mainColor,
            onTap: () {
              navigateTo(context, const ProductsDetailsScreen());
            },
            child: Card(
              elevation: 4,
              //shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  //side: const BorderSide(color: Colors.black26, width: 3),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(productsList[index]['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            productsList[index]['type'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            productsList[index]['pub_date'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.black45
                          : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productsList[index]['pub_date'],
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                        ),
                        const Icon(
                          Icons.apartment_sharp,
                          color: Colors.orange,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.orange,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        text: productsList[index]['title'],
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black,
                        underLine: TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              productsList[index]['pub_image'],
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextUtils(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          text: productsList[index]['pub_name'],
                          color: Colors.grey,
                          underLine: TextDecoration.none)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            text: productsList[index]['des_title'],
                            color: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : Colors.black,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text: "Beds : ${productsList[index]['des_beds']}",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text: "Paths : ${productsList[index]['des_paths']}",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text:
                                "Area : ${productsList[index]['des_area']} m2",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: productsList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
