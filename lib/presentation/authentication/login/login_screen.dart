import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/authentication/signup/signup_screen.dart';
import 'package:project_2/presentation/widgets/animated_button.dart';
import 'package:project_2/presentation/widgets/containers.dart';
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
  TextEditingController passwordcontroller = TextEditingController();

  StateMachineController? smcontroller;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    final viewinsects = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 10,
      //   backgroundColor: Constants.COLOR_BLUE,
      //   title: const TextBold(
      //     content: "Hello",
      //     fontsize: 50,
      //   ),
      // ),
      backgroundColor: Constants.COLOR_BLUE,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: desize.height * -.1 / 10,
              left: desize.width * 3.1 / 10,
              child: const TextBold(
                content: "Hello",
                fontsize: 50,
              ),
            ),
            Positioned(
              top: desize.height * .5 / 10,
              right: desize.width * -0.7 / 10,
              child: SizedBox(
                height: 190,
                width: 450,
                child: Center(
                  child: RiveAnimation.asset(
                    "assets/3287-6917-headless-bear.riv",
                    fit: BoxFit.cover,
                    placeHolder: const CircularProgressIndicator(
                      color: Constants.COLOR_BLACK,
                      strokeWidth: Constants.STROKETHICK,
                      value: .8,
                    ),
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
            ),
            Positioned(
              top: desize.height * 2.9 / 10,
              left: desize.width * .18 / 10,
              child: NeubrutContainer(
                height: desize.height * 2.75 / 10,
                width: desize.width * 9.6 / 10,
                color: Constants.COLOR_BLUE,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfeild(
                      heading: "Email",
                      hintText: "eg:name123@gmail.com",
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
                      heading: "Password",
                      hintText: "Enter a strong password",
                      controller: passwordcontroller,
                      focusnode: passwordFocusnode,
                      onchanged: (value) {},
                      icon: const Icon(
                        Ionicons.key,
                        size: 28,
                        color: Constants.COLOR_BLACK,
                      ),
                    ),
                    viewinsects.bottom == 0
                        ? Constants.HEIGHT10
                        : SizedBox(
                            height: viewinsects.bottom * 3 / 10,
                          )
                  ],
                ),
              ),
            ),
            Positioned(
              top: desize.height * 6.5 / 10,
              left: desize.width * 2.2 / 10,
              child: Column(
                children: [
                  const Text(
                    "Don't have a account ?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ));
                    },
                    style: TextButton.styleFrom(),
                    child: const TextSemiBold(
                      content: "Signup",
                      size: 16,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 55,
                    color: Constants.COLOR_BLACK,
                  )
                ],
              ),
            ),
            Positioned(
              top: desize.height * 8.3 / 10,
              left: desize.width * 1 / 10,
              child: AnimatedButton(
                width: desize.width * 8 / 10,
                cwidget: const TextSemiBold(
                  content: "Login",
                  size: 24,
                ),
                onTap: () {
                  isHandsUp?.change(false);
                  trigFail?.change(true);
                  // trigSuccess?.change(true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
