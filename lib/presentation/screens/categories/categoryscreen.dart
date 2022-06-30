import 'package:akary/data/models/categorymodel.dart';
import 'package:akary/presentation/screens/home/cubit/home_cubit.dart';
import 'package:akary/presentation/screens/home/cubit/home_state.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/presentation/widgets/categories/categoriescard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CatItem();
                      // CatItem(HomeCubit.get(context).categoryModel!.data);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount:
                        5, // HomeCubit.get(context).categoryModel!.data.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
