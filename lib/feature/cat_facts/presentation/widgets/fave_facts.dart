import 'package:cat_trivia/core/service_locator/service_locator.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/manager/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cat_fact_widget.dart';

class FaveFacts extends StatelessWidget {
  const FaveFacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageBloc = ServiceLocator.getIt.get<HomePageBloc>();
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.favFacts?.length,
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
                catFactEntity: state.favFacts![index],
                withImage: false,
                isFav: true,
              ),
            );
          },
        );
      },
    );
  }
}
