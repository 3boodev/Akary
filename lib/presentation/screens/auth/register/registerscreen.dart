import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/auth/forgetpassword/forgetpasswordscreen.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_state.dart';
import 'package:akary/presentation/screens/auth/login/loginscreen.dart';
import 'package:akary/presentation/screens/auth/register/cubit/register_cubit.dart';
import 'package:akary/presentation/screens/home/homescreen.dart';
import 'package:akary/presentation/widgets/auth/authbutton.dart';
import 'package:akary/presentation/widgets/auth/formfield.dart';
import 'package:akary/presentation/widgets/auth/socailbutton.dart';
import 'package:akary/presentation/widgets/auth/textbutton.dart';
import 'package:akary/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, dynamic>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 4), () {
                    Navigator.of(context).pop(true);
                  });
                  return AlertDialog(
                    title: const Text("Waiting Registration",
                        textAlign: TextAlign.center),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                });
          } else if (state is RegisterSuccessState) {
            CacheHelper.saveData(key: 'token', value: state.registerModel.jwt)
                .then((value) {
              token = state.registerModel.jwt;
              navigateToAndFinish(context, HomeScreen());
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Register Successful',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: mainColor,
              ));
            });
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Error In Registration ${state.error}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                      ),
                      defaultFormField(
                          controller: usernameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Name Must be Correct';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Email Must be Correct';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Password Must be Correct';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: RegisterCubit.get(context).Sofix,
                        isPassword: RegisterCubit.get(context).ispassowrd,
                        suffixpressed: () {
                          RegisterCubit.get(context)
                              .ChangeRegisterPasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          onpress: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).user_register(
                                  name: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                              GetStorage()
                                  .write('username', usernameController.text);
                              GetStorage().write('email', emailController.text);
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          width: 200,
                          text: 'Register',
                          radius: 10,
                          background: GetStorage().read('isDarkTheme') == true
                              ? Colors.black45
                              : mainColor,
                          isuppercase: true),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultTextButton(
                                onpress: () =>
                                    {navigateTo(context, LoginScreen())},
                                text: 'I have Account',
                                textColor: mainColor),
                            defaultTextButton(
                                onpress: () =>
                                    {navigateTo(context, LoginScreen())},
                                text: 'Login?',
                                textColor:
                                    GetStorage().read('isDarkTheme') == true
                                        ? Colors.white
                                        : Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
