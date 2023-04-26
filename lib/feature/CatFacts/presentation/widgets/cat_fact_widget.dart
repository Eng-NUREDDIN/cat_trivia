import 'dart:math';

import 'package:cat_trivia/core/AppConstants/string_constant.dart';
import 'package:cat_trivia/core/ServiceLocator/service_locator.dart';

import 'package:cat_trivia/feature/CatFacts/domain/entities/cat_fact_entity.dart';
import 'package:cat_trivia/feature/CatFacts/presentation/manager/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import 'cat_image.dart';

class CatFactWidget extends StatelessWidget {
  final CatFactEntity catFactEntity;
  bool withImage = true;
  bool isFav = false;
  Random random = Random();
  CatFactWidget(
      {Key? key,
      required this.catFactEntity,
      required this.withImage,
      this.isFav = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the cataas.com api is not working, so I am using http.cat api
    // final imageUrl =
    //     'https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}';
    final imageUrl= 'https://http.cat/${StringConstant.imageNumbers[random.nextInt(StringConstant.imageNumbers.length)]}';
    var homePageBloc = ServiceLocator.getIt.get<HomePageBloc>();
    final dateTime = DateTime.parse(catFactEntity.createdAt);
    final formattedDate = DateFormat.yMd().add_jm().format(dateTime);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<HomePageBloc, HomePageState>(
          bloc: homePageBloc,
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formattedDate),
                        IconButton(
                            onPressed: () {
                              homePageBloc.addToFave(catFactEntity);
                            },
                            icon: Icon(
                              isFav == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: Colors.red,
                            )),
                      ],
                    ),
                    Center(child: Text(catFactEntity.text)),
                    withImage == true
                        ? CatImage(imageUrl: imageUrl)
                        : const SizedBox(
                            height: 1,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
