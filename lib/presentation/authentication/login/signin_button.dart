import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../buisiness_logic/Login/login_bloc.dart';
import '../../widgets/animated_widtgets/animated_button.dart';
import '../../widgets/constants/constants.dart';
import '../../widgets/non_animated_widgets/text_widgets.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    Key? key,
    required this.desize,
    required this.trigFail,
    required this.trigSuccess,
    required this.isHandsUp,
    required this.formkey,
    required this.emailcontroller,
    required this.passwordcontroller,
  }) : super(key: key);

  final Size desize;
  final SMIInput<bool>? trigFail;
  final SMIInput<bool>? trigSuccess;
  final SMIInput<bool>? isHandsUp;
  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        final loginEither = state.loginOption.fold(() => null, (a) => a);

        // log(state.loginOption.isNone().toString());
        // log(state.loginOption.isSome().toString());

        if (loginEither!.isLeft()) {
          trigFail?.change(true);

          Constants().showFailedSnackbar(
              context: context, message: state.failure!.message);
        } else if (loginEither.isRight()) {
          // log("enterd sucess");

          trigSuccess?.change(true);
          Constants().showSucessSnackbar(
              context: context, message: "Logged in sucessfully");
        }
      },
      listenWhen: (previous, current) {
        log(previous.toString());
        log(current.toString());

        return current.loginOption.isSome();
      },
      builder: (context, state) {
        return AnimatedButton(
          isLoading: state.isLoading,
          width: desize.width * 8 / 10,
          cwidget: TextSemiBold(
            key: UniqueKey(),
            content: "Login",
            fontsize: 24,
          ),
          onTap: () async {
            isHandsUp?.change(false);
            if (formkey.currentState!.validate()) {
              BlocProvider.of<LoginBloc>(context).add(
                LoginRequested(
                    email: emailcontroller.text,
                    password: passwordcontroller.text),
              );
            }

            // trigSuccess?.change(true);
          },
        );
      },
    );
  }
}
