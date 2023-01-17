import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data_layer/dependancy_injection/injectable.dart';
import 'package:project_2/data_layer/repositeries/repositories.dart';
import 'package:project_2/presentation/authentication/login/login_screen.dart';

import 'buisiness_logic/Login/login_bloc.dart';


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
          BlocProvider(create: (context) => getIt<LoginBloc>()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorSchemeSeed: Colors.white,
              useMaterial3: true,
              fontFamily: 'Source Code Pro Regular'),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
