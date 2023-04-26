import 'package:flutter/cupertino.dart';

extension AppContext on BuildContext {
  double width([double factor = 1]) => MediaQuery.of(this).size.width * factor;

  double height([double factor = 1]) =>
      MediaQuery.of(this).size.height * factor;

//String translate(String key) => AppLocal.of(this).translate(key);
}
