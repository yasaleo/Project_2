import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/widgets/custom_textfeild.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';

import '../../widgets/containers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_PINKISH,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: desize.height * .1 / 10,
              left: desize.width * 2.5 / 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  TextBold(content: "Create", fontsize: 48),
                  TextBold(content: "Account"),
                ],
              ),
            ),
            Positioned(
              top: desize.height * 2 / 10,
              left: desize.width * .22 / 10,
              child: NeubrutContainer(
                height: desize.height * 4 / 10,
                width: desize.width * 9.6 / 10,
                color: Constants.COLOR_PINKISH,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: const [
                    CustomTextfeild(
                      hintText: "Enter your name",
                      icon: Icon(
                        Ionicons.person,
                        color: Constants.COLOR_BLACK,

                      ),
                    ),
                    CustomTextfeild(
                      hintText: "Enter your email",
                      icon: Icon(
                        Ionicons.mail,
                        color: Constants.COLOR_BLACK,

                      ),
                    ),
                    CustomTextfeild(
                      hintText: "Enter your Paasword",
                      icon: Icon(
                        Ionicons.key,
                        color: Constants.COLOR_BLACK,

                      ),
                    ),
                    CustomTextfeild(
                      hintText: "Confirm your password",
                      icon: Icon(
                        Ionicons.checkmark_done,
                        color: Constants.COLOR_BLACK,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
