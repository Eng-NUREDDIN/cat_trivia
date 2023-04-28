import 'package:cat_trivia/feature/cat_facts/presentation/manager/home_page_bloc.dart';
import 'package:flutter/material.dart';

import 'cat_button.dart';
import 'cat_fact_widget.dart';

class MainWidget extends StatelessWidget {
  final HomePageState state;

  const MainWidget(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        state.loading == true
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Center(
                child: CatFactWidget(
                    catFactEntity: state.catFact, withImage: true),
              )),
        const CatButton(),
      ],
    );
  }
}
