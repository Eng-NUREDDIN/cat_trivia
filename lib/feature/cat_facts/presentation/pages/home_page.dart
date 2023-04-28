import 'package:cat_trivia/core/app_constants/string_constant.dart';
import 'package:cat_trivia/core/global_widgets/app_background.dart';
import 'package:cat_trivia/core/service_locator/service_locator.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/manager/home_page_bloc.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/widgets/fact_history.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/widgets/fave_facts.dart';
import 'package:cat_trivia/feature/cat_facts/presentation/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageBloc = ServiceLocator.getIt.get<HomePageBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.APP_NAME),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: bottomNavigationBar(homePageBloc),
      body: BackgroundWidget(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          bloc: homePageBloc,
          builder: (context, state) {
            if (state.index == 0) {
              return MainWidget(state);
            } else if (state.index == 1) {
              return const FaveFacts();
            } else {
              return const FactHistory();
            }
          },
        ),
      ),
    );
  }

  Widget bottomNavigationBar(HomePageBloc homePageBloc) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            switch (index) {
              case 0:
                homePageBloc.add(const HomePageEvent.getFacts());
                break;
              case 1:
                homePageBloc.add(const HomePageEvent.getFavFacts());
                break;
              case 2:
                homePageBloc.add(const HomePageEvent.getFactHistory());
                break;
            }
          },
          currentIndex: homePageBloc.state.index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Fact history')
          ],
        );
      },
    );
  }
}
