import 'dart:math';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

import '../Login_Screen/Login_Screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> tabs = [
      OnboardingModel(
        'assets/animations/plumbers.json',
        San3aLayoutCubit.get(context).isArabic1?'احصل على عملك  ':'Get Your work ',
        San3aLayoutCubit.get(context).isArabic1?"تذكر أن تتبع إنجازاتك المهنية.":'Remember to keep track of your professional accomplishments.',
      ),
      OnboardingModel(
        'assets/animations/chat.json',
        San3aLayoutCubit.get(context).isArabic1?"الدردشة مع العمال" :'chat with workers',
        San3aLayoutCubit.get(context).isArabic1? "تحكم في الاشعارات وتعاون مباشرة أو في وقتك الخاص احصل على إشعار عندما يكون العامل جاهزًا.":'Take control of notifications, collaborate live or on your own time Get notified when worker ready.',
      ),
      OnboardingModel(
        'assets/animations/navigation.json',
        San3aLayoutCubit.get(context).isArabic1? 'أقرب مكان':' nearest place',
        San3aLayoutCubit.get(context).isArabic1? "يمكنك التواصل مع العامل الأقرب إليك " :'You can communicate with the worker closest to you ',
      ),
    ];
    var screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                CustomPaint(
                  painter: ArcPainter(),
                  child: SizedBox(
                    height: screenSize.height / 1.8,
                    width: screenSize.width,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.35,
                          child: Lottie.asset(
                            tabs[_currentIndex].lottieFile,
                            key: Key('${Random().nextInt(999999999)}'),
                            //width: screenSize.width * 0.1,
                            height: screenSize.height * 0.35,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.125),
                        SizedBox(
                            height: screenSize.height * 0.45,
                            child: Column(
                                children: [
                                  Flexible(
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: tabs.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        OnboardingModel tab = tabs[index];
                                        return SingleChildScrollView(
                                          child: Column(
                                            //mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                tab.title,
                                                style: const TextStyle(
                                                  fontSize: 27.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              //const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  tab.subtitle,
                                                  style: const TextStyle(
                                                    fontSize: 17.0,
                                                    color: Colors.white70,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      onPageChanged: (value) {
                                        _currentIndex = value;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      for (int index = 0; index <
                                          tabs.length; index++)
                                        _DotIndicator(
                                            isSelected: index == _currentIndex),
                                    ],
                                  ),
                                  //const SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        AnimatedButton(
                                          height: 40,
                                          width: double.infinity,
                                          text: San3aLayoutCubit.get(context).isArabic1?'التالى':'next',
                                          textStyle:
                                          TextStyle(
                                              color: Colors.black, fontSize: 20),
                                          isReverse: true,
                                          selectedTextColor: Colors.black,
                                          transitionType: TransitionType
                                              .LEFT_TO_RIGHT,
                                          backgroundColor: Colors.white,
                                          borderColor: Colors.white,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          onPress: () {
                                            if (_currentIndex == 2) {
                                              navigateTo(context, Login_Screen());
                                            } else {
                                              _pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.linear,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AnimatedButton(
                                          height: 40,
                                          width: double.infinity,
                                          text: San3aLayoutCubit.get(context).isArabic1?'تخطى':'skip',
                                          textStyle:
                                          TextStyle(
                                              color: Colors.black, fontSize: 20),
                                          isReverse: true,
                                          selectedTextColor: Colors.black,
                                          transitionType: TransitionType
                                              .LEFT_TO_RIGHT,
                                          backgroundColor: Colors.yellowAccent,
                                          borderColor: Colors.yellowAccent,
                                          borderRadius: 50,
                                          borderWidth: 1,
                                          onPress: () {
                                            navigateTo(context, Login_Screen());
                                          },
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        )
                                      ],
                                    ),
                                  ),
                                ]
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()
      ..color = Colors.yellowAccent);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height - 175)
      ..quadraticBezierTo(
          size.width / 2, size.height - 60, size.width, size.height - 185)
      ..lineTo(size.width, size.height)..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()
      ..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DotIndicator extends StatelessWidget {
  final bool isSelected;

  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6.0,
        width: 6.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.white38,
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}




