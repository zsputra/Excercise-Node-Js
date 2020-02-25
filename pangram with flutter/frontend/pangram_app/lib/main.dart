// import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:demo_app/presentation/home/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency_injection/getit_configuration.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // HomeBloc homeBloc = getIt<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: BlocProvider<HomeBloc>(
        create: (context) => getIt<HomeBloc>(),
        child: MyHomePage(),
      ),
    );
  }
}
