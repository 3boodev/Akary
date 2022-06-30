import 'package:akary/constants/const.dart';
import 'package:akary/presentation/screens/auth/login/loginscreen.dart';
import 'package:akary/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  List pageInfos = [
    {
      "title": "Search Your New Home",
      "body": "If you are looking for a new apartment or villa"
          "and you are tired of brokers, high prices"
          ", and lack of seriousness of sellers",
      "img": "assets/onboarding1.PNG",
    },
    {
      "title": "Use 3kary",
      "body": "Use 3kary and you will find many, many apartments and real estate that you will like"
          " With different prices and spaces in different areas in the Arab world"
          "Contact the seller directly and congratulations",
      "img": "assets/onboarding2.PNG",
    },
    {
      "title": "Find Your Needs",
      "body": "Congratulations on your new home and we are so glad you are using 3kary"
          "We will be very happy to deal with us next time or to recommend us to your friends and acquaintances "
          "Enjoy with us a more modern and more comfortable life",
      "img": "assets/onboarding3.PNG",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      for (int i = 0; i < pageInfos.length; i++) _buildPageModel(pageInfos[i])
    ];
    void submit() {
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        if (value) {
          navigateToAndFinish(context, LoginScreen());
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: const Text(
              'SKIP',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            onPressed: () {
              submit();
            },
          )
        ],
      ),
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          submit();
        },
        showSkipButton: false,
        showDoneButton: true,
        showNextButton: false,
        done: Container(
          child: const Text(
            'GET STARTED',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          color: Colors.deepPurple,
          alignment: Alignment.center,
          height: 50,
        ),
        dotsDecorator: DotsDecorator(
            color: Colors.transparent,
            activeColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.deepPurple))),
      ),
    );
  }

  _buildPageModel(Map item) {
    return PageViewModel(
      title: item['title'],
      body: item['body'],
      image: Image.asset(
        item['img'],
        height: 280,
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple),
        bodyTextStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
