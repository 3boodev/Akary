import 'package:akary/data/models/auth/login_model.dart';
import 'package:akary/shared/network/end_points.dart';
import 'package:akary/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void userlogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'identifier': email,
        'password': password,
      },
    ).then((value) {
      //print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }

  IconData Sofix = Icons.visibility;
  bool ispassowrd = true;

  void ChangePasswordVisibility() {
    ispassowrd = !ispassowrd;
    Sofix = ispassowrd ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}
