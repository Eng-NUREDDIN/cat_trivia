import 'package:cat_trivia/core/ServiceLocator/service_locator.dart';
import 'package:cat_trivia/feature/CatFacts/presentation/manager/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cat_fact_widget.dart';

class FactHistory extends StatelessWidget {
  const FactHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageBloc = ServiceLocator.getIt.get<HomePageBloc>();
    // return list view of facts with border and padding
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.facts?.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              //
              child: CatFactWidget(
                  catFactEntity: state.facts![index], withImage: false),
            );
          },
        );
      },
    );
  }
}
