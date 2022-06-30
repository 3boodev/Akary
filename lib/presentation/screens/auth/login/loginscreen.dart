import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/auth/forgetpassword/forgetpasswordscreen.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_state.dart';
import 'package:akary/presentation/screens/auth/register/registerscreen.dart';
import 'package:akary/presentation/screens/home/homescreen.dart';
import 'package:akary/presentation/widgets/auth/authbutton.dart';
import 'package:akary/presentation/widgets/auth/formfield.dart';
import 'package:akary/presentation/widgets/auth/socailbutton.dart';
import 'package:akary/presentation/widgets/auth/textbutton.dart';
import 'package:akary/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../shared/language/language_constants.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, dynamic>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 4), () {
                    Navigator.of(context).pop(true);
                  });
                  return AlertDialog(
                    title: const Text("Waiting Login",
                        textAlign: TextAlign.center),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                });
          } else if (state is LoginSuccessState) {
            //print(state.loginModel.jwt);
            CacheHelper.saveData(key: 'token', value: state.loginModel.jwt)
                .then((value) {
              token = state.loginModel.jwt;
              navigateToAndFinish(context, HomeScreen());
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Login Successful',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: mainColor,
              ));
            });
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Error In Login ${state.error}',
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
                        height: MediaQuery.of(context).size.height / 3.8,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Email Must be Correct';
                            }
                          },
                          label: translation(context).email_address,
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
                        label: translation(context).password,
                        prefix: Icons.lock_outline,
                        suffix: LoginCubit.get(context).Sofix,
                        isPassword: LoginCubit.get(context).ispassowrd,
                        suffixpressed: () {
                          LoginCubit.get(context).ChangePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: defaultTextButton(
                            onpress: () => {
                                  navigateTo(
                                      context, const ForgetPasswordScreen())
                                },
                            text: translation(context).forget_pass,
                            textColor: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : mainColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultButton(
                          onpress: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userlogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                              GetStorage().write('email', emailController.text);
                              //navigateToAndFinish(context, HomeScreen());
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          width: 200,
                          text: translation(context).login_btn,
                          radius: 10,
                          background: GetStorage().read('isDarkTheme') == true
                              ? Colors.black45
                              : mainColor,
                          isuppercase: true),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialButton(
                              onpress: () {},
                              image: "assets/images/facebook.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          socialButton(
                              onpress: () {},
                              image: "assets/images/google.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          socialButton(
                              onpress: () {},
                              image: "assets/images/twitter.png"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultTextButton(
                                onpress: () =>
                                    {navigateTo(context, RegisterScreen())},
                                text: translation(context).have_account,
                                textColor: mainColor),
                            defaultTextButton(
                                onpress: () =>
                                    {navigateTo(context, RegisterScreen())},
                                text: translation(context).create_account,
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
