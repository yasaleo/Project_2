// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:project_2/data_layer/repositeries/repositories.dart';
import 'package:project_2/presentation/authentication/login/signin_screen.dart';
import 'package:project_2/presentation/widgets/constants/constants.dart';
import 'package:project_2/presentation/widgets/animated_widtgets/animated_button.dart';
import 'package:project_2/presentation/widgets/non_animated_widgets/text_widgets.dart';

import '../../widgets/non_animated_widgets/custom _otp_feild.dart';

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
                    builder: (context) => const SigninScreen(),
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


