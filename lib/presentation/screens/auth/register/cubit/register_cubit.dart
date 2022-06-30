import 'package:akary/data/models/auth/register_model.dart';
import 'package:akary/shared/network/end_points.dart';
import 'package:akary/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;
  void user_register({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "username":name,
        "email": email,
        "password": password
      },
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterErrorState(onError.toString()));
    });
  }

  IconData Sofix = Icons.visibility;
  bool ispassowrd = true;

  void ChangeRegisterPasswordVisibility() {
    ispassowrd = !ispassowrd;
    Sofix = ispassowrd ? Icons.visibility : Icons.visibility_off;
    emit(ChangeRegiserPasswordVisibilityState());
  }
}
