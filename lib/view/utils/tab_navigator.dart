import 'package:audio_playground/view/pages/STT_page.dart';
import 'package:audio_playground/view/pages/TTS_page.dart';
import 'package:flutter/material.dart';

import '../../model/utils/tab.dart';
import '../pages/settings_page.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.navigatorKey, required this.tabItem, required this.selectTabFunction});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final Function selectTabFunction;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        Widget currentPage;
        if (tabItem == TabItem.STT) {
          currentPage = const STTPage();
        } else if (tabItem == TabItem.TTS) {
          currentPage = const TTSPage();
        } else {
          currentPage = const SettingsPage();
        }
        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }
}
