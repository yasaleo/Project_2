import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buisiness_logic/Login/login_bloc.dart';
import 'data_layer/dependancy_injection/injectable.dart';
import 'data_layer/repositeries/repositories.dart';
import 'presentation/authentication/login/signin_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repositories(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return getIt<LoginBloc>();
            },
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorSchemeSeed: Colors.white,
              useMaterial3: true,
              fontFamily: 'Source Code Pro Regular'),
          home: const SigninScreen(),
        ),
      ),
    );
  }
}
