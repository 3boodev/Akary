import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/products/productsdetailscreen.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsojqA-M5BYNXozUF6bWXa3zcw_FWmVF4O3w&usqp=CAU',
                            ),
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
                          child: const Text(
                            'FOR RENT',
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
                          child: const Text(
                            '20-6-2021',
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
                        const Text(
                          '20-6-2021',
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
                        text: "\t House is Power",
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsojqA-M5BYNXozUF6bWXa3zcw_FWmVF4O3w&usqp=CAU',
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
                          text: "Ahmed Mohamed",
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
                            text: "Flat Home",
                            color: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : Colors.black,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text: "Beds : 4",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text: "Paths : 2",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            text: "Area : 3600 m2",
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
        itemCount: 6,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
