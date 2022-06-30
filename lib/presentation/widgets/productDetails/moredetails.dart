import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.apartment,
                    color: mainColor,
                    size: 30,
                  ),
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: "Apartment",
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                      underLine: TextDecoration.none),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.photo_size_select_large_sharp,
                    color: mainColor,
                    size: 30,
                  ),
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: "Area : 2000m2",
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                      underLine: TextDecoration.none),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.bed_outlined,
                    color: mainColor,
                    size: 30,
                  ),
                  TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: "Beds : 3",
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                      underLine: TextDecoration.none),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: "Overview",
              color: mainColor,
              underLine: TextDecoration.none),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              text: "      this flat is in giza Egypt",
              color: GetStorage().read('isDarkTheme') == true
                  ? Colors.white
                  : Colors.black54,
              underLine: TextDecoration.none),
          const SizedBox(
            height: 30,
          ),
          TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: "Details",
              color: mainColor,
              underLine: TextDecoration.none),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bed_outlined,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Beds : \t\t\t\t 5",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bathtub_outlined,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Baths : \t\t\t 3",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.all_out,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Lot Area :\t m2",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.storage,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Year Built :\t 2015",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.merge_type,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Type : \t\t Apartment",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.straighten,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Built up Area :\t\t 2000m2",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.price_change_outlined,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        text: "  Price : \t\t\t\t 20000 KWD",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
