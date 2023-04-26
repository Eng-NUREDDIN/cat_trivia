import 'package:cat_trivia/core/AppManager/color_manager.dart';
import 'package:cat_trivia/core/ServiceLocator/service_locator.dart';
import 'package:cat_trivia/feature/CatFacts/presentation/manager/home_page_bloc.dart';
import 'package:cat_trivia/feature/CatFacts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'feature/CatFacts/data/local/models/cat_fact_entity_adapter.dart';
import 'feature/CatFacts/data/local/models/cat_fact_model_adapter.dart';
import 'feature/CatFacts/data/remote/models/cat_fact_model.dart';
import 'feature/CatFacts/domain/entities/cat_fact_entity.dart';

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
