import 'package:akary/constants/const.dart';
import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/screens/home/cubit/home_cubit.dart';
import 'package:akary/presentation/screens/home/cubit/home_state.dart';
import 'package:akary/presentation/screens/search/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                flexibleSpace: cubit.currentindex == 3
                    ? Container(
                        decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: GetStorage().read('isDarkTheme') == true
                              ? [Colors.black45, Colors.black45]
                              : [mainColor, statusBarColor],
                        ),
                      ))
                    : Container(
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.black45
                            : Colors.white,
                      ),
                title: Text(
                  '3kary',
                  style: TextStyle(
                      color:
                          cubit.currentindex == 3 ? Colors.white : mainColor),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color:
                            cubit.currentindex == 3 ? Colors.white : mainColor,
                      ),
                      onPressed: () {
                        navigateTo(context, const SearchScreen());
                      })
                ],
              ),
              body: cubit.bottomscreens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.ChangeBottom(index);
                },
                currentIndex: cubit.currentindex,
                selectedItemColor: mainColor,
                unselectedItemColor: GetStorage().read('isDarkTheme') == true
                    ? Colors.white
                    : Colors.black54,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favourites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            );
          }),
    );
  }
}
