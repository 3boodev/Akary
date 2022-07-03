import 'dart:convert';

import 'package:akary/data/models/categorymodel.dart';
import 'package:akary/presentation/screens/home/cubit/home_cubit.dart';
import 'package:akary/presentation/screens/home/cubit/home_state.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/presentation/widgets/categories/categoriescard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ErrorCategoriesState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                      text: "Categories",
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CatItem(0)
              ],
            ),
          );
        });
  }
}
