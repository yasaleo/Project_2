import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/widgets/animated_button.dart';
import 'package:rive/rive.dart';

import 'package:project_2/presentation/constants/constants.dart';

import '../../widgets/custom_textfeild.dart';
import '../../widgets/text_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    emailFocusnode.addListener(emailfocus);
    passwordFocusnode.addListener(passwordfocus);
    super.initState();
  }

  emailfocus() {
    isChecking?.change(emailFocusnode.hasFocus);
  }

  passwordfocus() {
    isHandsUp?.change(passwordFocusnode.hasFocus);
  }

  @override
  void dispose() {
    emailFocusnode.removeListener(emailfocus());
    passwordFocusnode.removeListener(passwordfocus());

    super.dispose();
  }

  FocusNode emailFocusnode = FocusNode();
  FocusNode passwordFocusnode = FocusNode();
  TextEditingController emailcontroller = TextEditingController();

  StateMachineController? smcontroller;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_BLUE,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 250,
                width: 450,
                child: RiveAnimation.asset(
                  "assets/3287-6917-headless-bear.riv",
                  fit: BoxFit.cover,
                  stateMachines: const ["Login Machine"],
                  onInit: (artboard) {
                    smcontroller = StateMachineController.fromArtboard(
                        artboard, "Login Machine");
                    if (smcontroller == null) return;
                    artboard.addController(smcontroller!);
                    isChecking = smcontroller?.findInput("isChecking");
                    numLook = smcontroller?.findInput("numLook");
                    isHandsUp = smcontroller?.findInput("isHandsUp");
                    trigSuccess = smcontroller?.findInput("trigSuccess");
                    trigFail = smcontroller?.findInput("trigFail");
                  },
                ),
              ),
            ),
            // Positioned(
            //   left: desize.width * .4 / 10,
            //   top: desize.height * 3 / 10,
            //   child: const TextBold(
            //     content: "Login",
            //     fontsize: 50,
            //   ),
            // ),
            Positioned(
                top: 180,
                left: 15,
                child: SizedBox(
                  height: 300,
                  width: 360,
                  child: ListView(
                    children: [
                      const TextBold(
                        content: "Login",
                        fontsize: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfeild(
                        hintText: "Enter your Email",
                        controller: emailcontroller,
                        icon: const Icon(
                          Ionicons.mail,
                          size: 28,
                          color: Constants.COLOR_BLACK,
                        ),
                        focusnode: emailFocusnode,
                        onchanged: (value) {
                          numLook?.change(value.length.toDouble());
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfeild(
                        hintText: "Enter your password",
                        focusnode: passwordFocusnode,
                        icon: const Icon(
                          Ionicons.key,
                          size: 28,
                          color: Constants.COLOR_BLACK,
                        ),
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 590,
              left: 20,
              child: AnimatedButton(
                cwidget: const TextSemiBold(
                  content: "Login",
                  size: 24,
                ),
                onTap: () {
                  isHandsUp?.change(false);
                  trigFail?.change(true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
