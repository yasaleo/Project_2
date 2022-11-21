import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/widgets/animated_button.dart';
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
    final viewinsects = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    return Scaffold(
      backgroundColor: Constants.COLOR_PINKISH,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: desize.height * .1 / 10,
              left: desize.width * .5 / 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextBold(content: "Create", fontsize: 48),
                  TextBold(content: "Account"),
                ],
              ),
            ),
            Positioned(
              top: desize.height * 2 / 10,
              left: desize.width * .18 / 10,
              child: NeubrutContainer(
                height: desize.height * 4.3 / 10,
                width: desize.width * 9.6 / 10,
                color: Constants.COLOR_PINKISH,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  children: [
                    Constants.HEIGHT10,
                    const CustomTextfeild(
                      heading: "Name",
                      hintText: "name eg: Alan Thomas",
                      icon: Icon(
                        Ionicons.person,
                        color: Constants.COLOR_BLACK,
                      ),
                    ),
                    Constants.HEIGHT10,
                    const CustomTextfeild(
                      heading: "Email",
                      hintText: "eg:name123@gmail.com",
                      icon: Icon(
                        Ionicons.mail,
                        color: Constants.COLOR_BLACK,
                      ),
                    ),
                    Constants.HEIGHT10,
                    const CustomTextfeild(
                      heading: "Password",
                      hintText: "Enter a Strong Password",
                      icon: Icon(
                        Ionicons.key,
                        color: Constants.COLOR_BLACK,
                      ),
                    ),
                    Constants.HEIGHT10,
                    const CustomTextfeild(
                      heading: "Confirm",
                      hintText: "Enter your password again",
                      icon: Icon(
                        Ionicons.checkmark_done,
                        color: Constants.COLOR_BLACK,
                      ),
                    ),
                    viewinsects.bottom == 0
                        ? Constants.HEIGHT10
                        : SizedBox(
                            height: viewinsects.bottom * 3.8 / 10,
                          )
                  ],
                ),
              ),
            ),
            Positioned(
              top: desize.height * 8.3 / 10,
              left: desize.width * 1 / 10,
              child: AnimatedButton(
                width: desize.width * 8 / 10,
                cwidget: const TextSemiBold(content: "Create"),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
