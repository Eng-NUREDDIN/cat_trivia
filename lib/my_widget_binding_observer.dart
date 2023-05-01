import 'package:flutter/widgets.dart';

import 'core/service_locator/service_locator.dart';

class MyWidgetsBindingObserver extends WidgetsBindingObserver {
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
      // the application is visible and responding to user input
        break;
      case AppLifecycleState.inactive:
      // the application is in an inactive state and is not receiving user input
        break;
      case AppLifecycleState.paused:
      // the application is not currently visible to the user and might be terminated soon
        break;
      case AppLifecycleState.detached:
      // the application is in a detached state and is no longer responding to user input
        await ServiceLocator.closeHive(); // close the Hive boxes
        break;
    }
  }
}
