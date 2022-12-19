import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/dataLayer/model/signupmodel.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/widgets/animated_button.dart';
import 'package:project_2/presentation/widgets/custom_textfeild.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';
import '../../../dataLayer/auth_services.dart';
import '../../widgets/containers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  bool isObscure = true;
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
                height: desize.height * 4.8 / 10,
                width: desize.width * 9.6 / 10,
                color: Constants.COLOR_PINKISH,
                child: Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    children: [
                      Constants.HEIGHT10,
                      CustomTextfeild(
                        controller: firstnameController,
                        heading: "First name",
                        hintText: " eg: Alan ",
                        icon: const Icon(
                          Ionicons.person,
                          color: Constants.COLOR_BLACK,
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return "First name is required";
                          }
                        },
                      ),
                      CustomTextfeild(
                        controller: lastnameController,
                        heading: "Last name",
                        hintText: " eg: Thomas",
                        icon: const Icon(
                          Ionicons.person,
                          color: Constants.COLOR_BLACK,
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Last name is required";
                          }
                        },
                      ),
                      Constants.HEIGHT10,
                      CustomTextfeild(
                        controller: emailController,
                        heading: "Email",
                        hintText: "eg:name123@gmail.com",
                        icon: const Icon(
                          Ionicons.mail,
                          color: Constants.COLOR_BLACK,
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                        },
                      ),
                      Constants.HEIGHT10,
                      CustomTextfeild(
                        controller: passwordController,
                        heading: "Password",
                        hintText: "Enter a Strong Password",
                        obscureText: isObscure,
                        icon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure ? Ionicons.eye_off : Ionicons.eye,
                            color: Constants.COLOR_BLACK,
                          ),
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return "Contain atleast 6 characters";
                          }
                        },
                      ),
                      Constants.HEIGHT10,
                      CustomTextfeild(
                        controller: confirmpasswordController,
                        heading: "Confirm",
                        hintText: "Enter your password again",
                        obscureText: true,
                        icon: const Icon(
                          Ionicons.checkmark_done,
                          color: Constants.COLOR_BLACK,
                        ),
                        onchanged: (value) {},
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Does not matches";
                          }
                        },
                      ),
                      viewinsects.bottom == 0
                          ? Constants.HEIGHT10
                          : SizedBox(
                              height: viewinsects.bottom *
                                  (viewinsects.bottom / 95) /
                                  10,
                            )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: desize.height * 8.3 / 10,
              left: desize.width * 1 / 10,
              child: AnimatedButton(
                width: desize.width * 8 / 10,
                cwidget: const TextSemiBold(content: "Create"),
                onTap: () async {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const DefaultScreen(),
                  //   ),
                  // );

                  if (formkey.currentState!.validate()) {
                  final respone = await  Authsevices().register(model: SignupModel(
                      email: emailController.text,
                      name: firstnameController.text,
                      password: confirmpasswordController.text
                    ),);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(respone!),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
