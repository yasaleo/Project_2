// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/dataLayer/repositories.dart';
import 'package:project_2/presentation/authentication/login/login_screen.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/widgets/animated_button.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController firstdigit = TextEditingController();
  final TextEditingController seconddigit = TextEditingController();
  final TextEditingController thirddigit = TextEditingController();
  final TextEditingController fourthdigit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_ORANGISH,
      body: Stack(
        children: [
          Positioned(
            top: desize.height * .8 / 10,
            left: desize.width * .5 / 10,
            child: TextBold(
              content: "Verification code",
              fontsize: desize.width * .7 / 10,
            ),
          ),
          Positioned(
            top: desize.height * 1.4 / 10,
            left: desize.width * .6 / 10,
            child: TextSemiBold(
              content: "We have send otp to your email ",
              fontsize: desize.width * .45 / 10,
              color: Constants.COLOR_SEMIBLACK,
            ),
          ),
          Positioned(
            top: desize.height * 2.9 / 10,
            left: desize.width * .6 / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpFeild(
                  first: true,
                  controller: firstdigit,
                ),
                Constants.WIDTH20,
                OtpFeild(
                  controller: seconddigit,
                ),
                Constants.WIDTH20,
                OtpFeild(
                  controller: thirddigit,
                ),
                Constants.WIDTH20,
                OtpFeild(
                  last: true,
                  controller: fourthdigit,
                ),
              ],
            ),
          ),
          Positioned(
            top: desize.height * 6.6 / 10,
            left: desize.width * 3 / 10,
            child: const Text("Didn't receive otp?"),
          ),
          Positioned(
            top: desize.height * 7 / 10,
            left: desize.width * 4 / 10,
            child: Column(
              children: [
                TextButton(
                  child: const TextSemiBold(content: "Resend", fontsize: 18),
                  onPressed: () {},
                ),
                Container(
                  color: Constants.COLOR_BLACK,
                  height: 2,
                  width: 60,
                )
              ],
            ),
          ),
          Positioned(
            top: desize.height * 8.9 / 10,
            left: desize.width * 1.2 / 10,
            child: AnimatedButton(
              cwidget: const TextSemiBold(content: "Verify"),
              width: desize.width * 8 / 10,
              onTap: () async {
                final otp = firstdigit.text +
                    seconddigit.text +
                    thirddigit.text +
                    fourthdigit.text;
                final code = await Repositories()
                    .verifyOtp(email: widget.email, otp: otp);
                if (code == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("User created successfully")));
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                }
                // print(code);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OtpFeild extends StatelessWidget {
  const OtpFeild(
      {Key? key, this.last = false, this.first = false, this.controller})
      : super(key: key);
  final bool last;
  final bool first;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;

    return SizedBox(
      height: desize.height * .6 / 10,
      width: desize.width * 1 / 10,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        cursorColor: Constants.COLOR_BLACK,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(fontSize: 18),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: Constants.STROKETHICK,
              color: Constants.COLOR_BLACK,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: Constants.STROKETHICK,
              color: Constants.COLOR_BLACK,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: Constants.STROKETHICK,
              color: Constants.COLOR_BLACK,
            ),
          ),
        ),
      ),
    );
  }
}
