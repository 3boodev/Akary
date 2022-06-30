import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/auth/authbutton.dart';
import 'package:akary/presentation/widgets/search/searchcategory.dart';
import 'package:akary/presentation/widgets/search/searchlocation.dart';
import 'package:akary/presentation/widgets/search/searchprice.dart';
import 'package:akary/presentation/widgets/search/searchtype.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: GetStorage().read('isDarkTheme') == true
                  ? Colors.white
                  : mainColor,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchLocation(),
                const SizedBox(
                  height: 10,
                ),
                const SearchType(),
                SearchPrice(),
                const SearchCategory(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: defaultButton(
                      onpress: () {},
                      width: 200,
                      text: 'Search',
                      radius: 10,
                      background: GetStorage().read('isDarkTheme') == true
                          ? Colors.black45
                          : mainColor,
                      isuppercase: true),
                ),
              ],
            ),
          ),
        ));
  }
}
