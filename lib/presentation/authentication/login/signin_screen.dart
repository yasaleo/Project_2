// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/authentication/login/signin_button.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/fade_animation.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/page_transition_builder.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/slide_animation.dart';
import 'package:rive/rive.dart';

import '../../widgets/constants/constants.dart';
import '../../widgets/non_animated_widgets/containers.dart';
import '../../widgets/non_animated_widgets/custom_textfeild.dart';
import '../../widgets/non_animated_widgets/text_widgets.dart';
import '../signup/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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

  final formkey = GlobalKey<FormState>();
  final ValueNotifier<bool> isObscureNotifier = ValueNotifier(true);

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
      backgroundColor: Constants.COLOR_BLUE,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: desize.height * -.1 / 10,
              left: desize.width * 2.8 / 10,
              child: const TextBold(
                content: "Hello!",
                fontsize: 50,
              ),
            ),
            Positioned(
              top: desize.height * .5 / 10,
              right: desize.width * -0.7 / 10,
              child: CustomFadeAnimation(
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
            ),
            Positioned(
              top: desize.height * 2.9 / 10,
              left: desize.width * .18 / 10,
              child: NeubrutContainer(
                height: desize.height * 2.95 / 10,
                width: desize.width * 9.6 / 10,
                color: Constants.COLOR_BLUE,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
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
                          numLook?.change(value!.length.toDouble());
                        },
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ValueListenableBuilder(
                          valueListenable: isObscureNotifier,
                          builder: (BuildContext context, bool isObscure, _) {
                            return CustomTextfeild(
                              isObscure: isObscure,
                              heading: "Password",
                              hintText: "Enter a strong password",
                              controller: passwordcontroller,
                              focusnode: passwordFocusnode,
                              onchanged: (value) {},
                              icon: GestureDetector(
                                onTap: () {
                                  isObscureNotifier.value =
                                      !isObscureNotifier.value;

                                  isHandsUp!.change(!isObscure);
                                },
                                child: Icon(
                                  isObscure
                                      ? Ionicons.eye_off_outline
                                      : Ionicons.eye_outline,
                                  size: 28,
                                  color: Constants.COLOR_BLACK,
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return "contains atleast 6 charcters";
                                }
                              },
                            );
                          }),
                      viewinsects.bottom == 0
                          ? const SizedBox()
                          : SizedBox(
                              height: viewinsects.bottom *
                                  (viewinsects.bottom / 160) /
                                  10,
                            )
                    ],
                  ),
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
                      Navigator.of(context).push(
                        CustomPageRoute().animatedRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SignupScreen(
                                    animation: animation,
                                  ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(),
                    child: const TextSemiBold(
                      content: "Signup",
                      fontsize: 16,
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
              child: CustomFadeAnimation(
                child: SizedBox(
                  child: SigninButton(
                    desize: desize,
                    trigFail: trigFail,
                    trigSuccess: trigSuccess,
                    isHandsUp: isHandsUp,
                    formkey: formkey,
                    emailcontroller: emailcontroller,
                    passwordcontroller: passwordcontroller,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
