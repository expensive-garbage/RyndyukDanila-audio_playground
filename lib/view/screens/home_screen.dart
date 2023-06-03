import 'package:flutter/material.dart';

import '../../model/utils/tab.dart';
import '../utils/bottom_navigation.dart';
import '../utils/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _navigatorKeys = {
    TabItem.STT: GlobalKey<NavigatorState>(),
    TabItem.TTS: GlobalKey<NavigatorState>(),
    TabItem.SETTINGS: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.STT;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.STT) {
          _selectTab(TabItem.STT);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.STT),
          _buildOffstageNavigator(TabItem.TTS),
          _buildOffstageNavigator(TabItem.SETTINGS),
        ]),
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        selectTabFunction: _selectTab,
      ),
    );
  }
}
