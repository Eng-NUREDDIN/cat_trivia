import 'package:cat_trivia/core/app_manager/color_manager.dart';
import 'package:cat_trivia/core/service_locator/service_locator.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/manager/home_page_bloc.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.initHive();

  await ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(ServiceLocator.getIt()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorManager.primary,
        ),
        home: const HomePage(),
      ),
    );
  }
}
