import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    //print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    //print("CURRENCY NAME ${format.currencyName}");
    return Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: GetStorage().read('isDarkTheme') == true
              ? Colors.black45
              : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: GetStorage().read('isDarkTheme') == true
                  ? Colors.white.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          InkWell(
              onTap: () {},
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_basket_outlined,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite, color: mainColor),
                        onPressed: () {},
                      ),
                    ]),
                Hero(
                  tag: 'tage',
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsojqA-M5BYNXozUF6bWXa3zcw_FWmVF4O3w&usqp=CAU'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text('${format.format(200000)} ${format.currencyName}',
                    style: const TextStyle(
                      color: statusBarColor,
                      fontSize: 16,
                    )),
                const SizedBox(height: 5),
                Text("فيلا بالتجمع الخامس",
                    style: TextStyle(
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : destext,
                        fontSize: 14.0)),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.straighten,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : Colors.black54,
                    ),
                    TextUtils(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        text: "  2000 m2",
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.white
                            : Colors.black87,
                        underLine: TextDecoration.none),
                  ],
                ),
              ]))
        ]));
  }
}
