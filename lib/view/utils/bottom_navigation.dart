import 'package:flutter/material.dart';

import '../../model/utils/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.STT: MyTab(name: "STT", icon: Icons.record_voice_over_rounded),
  TabItem.TTS: MyTab(name: "TTS", icon: Icons.speaker_notes_rounded),
  TabItem.SETTINGS: MyTab(name: "Settings", icon: Icons.settings_rounded)
};

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key, required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab.index,
        items: [
          _buildItem(TabItem.STT),
          _buildItem(TabItem.TTS),
          _buildItem(TabItem.SETTINGS),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(tabs[item]!.icon),
      label: tabs[item]!.name,
    );
  }
}
