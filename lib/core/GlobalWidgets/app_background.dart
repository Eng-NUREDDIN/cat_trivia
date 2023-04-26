import 'package:cat_trivia/core/AppConstants/assets.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: const AssetImage(Assets.background),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.7),
            // replace with your desired color and opacity
            BlendMode.lighten,
          ),
        ),
      ),
      child: child,
    );
  }

  const BackgroundWidget({
    super.key,
    required this.child,
  });
}
