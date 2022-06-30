import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:akary/presentation/screens/auth/login/cubit/login_state.dart';
import 'package:akary/presentation/screens/auth/login/loginscreen.dart';
import 'package:akary/presentation/screens/home/cubit/home_cubit.dart';
import 'package:akary/presentation/screens/home/homescreen.dart';
import 'package:akary/presentation/screens/onboarding/onboardingscreen.dart';
import 'package:akary/shared/bloc_observer.dart';
import 'package:akary/shared/language/language_constants.dart';
import 'package:akary/shared/network/local/cache_helper.dart';
import 'package:akary/shared/network/remote/dio_helper.dart';
import 'package:akary/shared/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await GetStorage.init();
  await CacheHelper.init();
  Widget widget;
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  var token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatefulWidget {
  final Widget? startwidget;

  const MyApp({Key? key, this.startwidget}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext conext) => LoginCubit(),
          ),
          BlocProvider(
              create: (BuildContext conext) => HomeCubit()..getcategoryData())
        ],
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return GetMaterialApp(
              theme: ThemeServices().lightTheme,
              darkTheme: ThemeServices().darkTheme,
              themeMode: ThemeServices().getThemeMode(),
              title: '3kary',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              home: widget.startwidget,
            );
          },
        ));
  }
}
