import 'package:flutter/material.dart';
import 'package:project_2/presentation/authentication/login/signin_screen.dart';

import 'package:project_2/presentation/authentication/signup/signup_screen.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/fade_animation.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/page_transition_builder.dart';
import 'package:project_2/presentation/widgets/constants/constants.dart';
import 'package:project_2/presentation/widgets/non_animated_widgets/text_widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 2500), () {
    //   Navigator.push(
    //     context,
    //     CustomPageRoute().animatedRouteBuilder(
    //       widget: const SigninScreen(),
    //     ),
    //   );
    // });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomFadeAnimation(
              child: TextBold(
                content: "Splash Screen",
                color: Constants.COLOR_BLACK,
                fontsize: 30,
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CustomPageRoute().animatedRouteBuilder(
                    widget: const SigninScreen(),
                  ),
                );
              },
              child: const TextSemiBold(content: "Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
