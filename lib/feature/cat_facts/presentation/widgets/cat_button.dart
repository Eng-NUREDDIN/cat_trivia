import 'package:cat_trivia/core/service_locator/service_locator.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/manager/home_page_bloc.dart';
import 'package:flutter/material.dart';

class CatButton extends StatelessWidget {
  const CatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageBloc = ServiceLocator.getIt.get<HomePageBloc>();
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        disabledForegroundColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () {
        homePageBloc.add(const HomePageEvent.getFacts());
      },
      child: const Text("Get Another Cat Facts"),
    );
  }
}
