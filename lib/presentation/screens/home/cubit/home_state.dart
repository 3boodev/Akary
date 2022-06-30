import 'package:akary/data/models/auth/login_model.dart';
import 'package:akary/data/models/changefavoritesmodel.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class LoadingHomeDataState extends HomeState {}

class SuccessHomeDataState extends HomeState {}

class ErrorHomeDataState extends HomeState {}

class SuccessCategoriesState extends HomeState {}

class ErrorCategoriesState extends HomeState {}

class SuccessFavoritesState extends HomeState {
  final ChangeFavoritesModel model;
  SuccessFavoritesState(this.model);
}

class SuccesschangeFavoritesState extends HomeState {}

class ErrorFavoritesState extends HomeState {}

class LoadingGetFavoritesState extends HomeState {}

class SuccessGetFavoritesState extends HomeState {}

class ErrorGetFavoritesState extends HomeState {}

class LoadingGetUserState extends HomeState {}

class SuccessGetUserState extends HomeState {
  final LoginModel user_model;
  SuccessGetUserState(this.user_model);
}

class ErrorGetUserState extends HomeState {}

class LoadingUpdateUserState extends HomeState {}

class SuccessUpdateUserState extends HomeState {
  final LoginModel user_model;
  SuccessUpdateUserState(this.user_model);
}

class ErrorUpdateUserState extends HomeState {}
