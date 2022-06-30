import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/shared/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constants/const.dart';
import '../../../main.dart';
import '../../../shared/language/language.dart';
import '../../../shared/language/language_constants.dart';
import '../../../shared/network/local/cache_helper.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);
  @override
  State<ProfileWidget> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  GetStorage().read('isDarkTheme') == true
                      ? Colors.black12
                      : mainColor,
                  GetStorage().read('isDarkTheme') == true
                      ? Colors.black12
                      : statusBarColor
                ],
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(60),
                  bottomRight: const Radius.circular(60))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          ThemeServices().changeTheme();
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GetStorage().read('isDarkTheme') == true
                                ? mainColor
                                : Colors.white,
                          ),
                          child: Icon(
                            GetStorage().read('isDarkTheme') == true
                                ? Icons.dark_mode_outlined
                                : Icons.light_mode_outlined,
                            color: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : mainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white60,
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors
                                  .white, //Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: mainColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  text: GetStorage().read('username') ?? "User Name",
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    text: GetStorage().read('email') ?? "email@gmail.com",
                    color: Colors.white,
                    underLine: TextDecoration.none),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : mainColor,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_box_outlined,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : mainColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      translation(context).account_title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(context, "Change Password", Icons.lock),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildAccountOptionRow(context,
                      translation(context).changeLanguage, Icons.language),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.width / 10,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : mainColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? const Text(
                                    "EN 🇺🇸",
                                    style: const TextStyle(fontSize: 20),
                                  )
                                : const Text(
                                    "AR 🇸🇦",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<Language>(
                                iconSize: 25,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color:
                                      GetStorage().read('isDarkTheme') == true
                                          ? Colors.white
                                          : mainColor,
                                ),
                                dropdownColor:
                                    GetStorage().read('isDarkTheme') == true
                                        ? Colors.black54
                                        : Colors.white,
                                items: Language.languageList()
                                    .map<DropdownMenuItem<Language>>(
                                      (e) => DropdownMenuItem<Language>(
                                        value: e,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              e.flag,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            Text(e.name,
                                                style: TextStyle(
                                                  color: GetStorage().read(
                                                              'isDarkTheme') ==
                                                          true
                                                      ? Colors.white
                                                      : Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (Language? language) async {
                                  if (language != null) {
                                    Locale _locale =
                                        await setLocale(language.languageCode);
                                    MyApp.setLocale(context, _locale);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              buildAccountOptionRow(context, translation(context).privacy,
                  Icons.privacy_tip_outlined),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : mainColor,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : mainColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      translation(context).more_settings,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow(
                  translation(context).active_notifications,
                  true,
                  Icons.notifications_outlined),
              buildNotificationOptionRow(translation(context).availability,
                  false, Icons.event_available),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Logout(context);
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GetStorage().read('isDarkTheme') == true
                            ? Colors.black54
                            : mainColor,
                      ),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign Out",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GetStorage().read('isDarkTheme') == true
                    ? Colors.black54
                    : mainColor,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Switch(
          value: isActive,
          onChanged: (bool val) {
            val != val;
          },
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: GetStorage().read('isDarkTheme') == true
                        ? Colors.white
                        : mainColor,
                  )),
              child: Icon(
                icon,
                color: GetStorage().read('isDarkTheme') == true
                    ? Colors.white
                    : mainColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
