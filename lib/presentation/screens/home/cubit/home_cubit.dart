import 'package:akary/data/models/categorymodel.dart';
import 'package:akary/presentation/screens/categories/categoryscreen.dart';
import 'package:akary/presentation/screens/favorites/favoritescreen.dart';
import 'package:akary/presentation/screens/products/productscreen.dart';
import 'package:akary/presentation/screens/settings/settingscreen.dart';
import 'package:akary/shared/network/end_points.dart';
import 'package:akary/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:akary/presentation/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> bottomscreens = [
    ProductsScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void ChangeBottom(int index) {
    currentindex = index;
    emit(ChangeBottomNavState());
  }

  CategoryModel? categoryModel;

  void getcategoryData() {
    DioHelper.getData(url: CATEGORIES).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      print(value.data);
      emit(SuccessCategoriesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorCategoriesState());
    });
  }
}
