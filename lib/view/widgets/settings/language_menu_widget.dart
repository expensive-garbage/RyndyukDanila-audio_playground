import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum SampleItem { English, French, Spanish }

class LanguageMenuWidget extends StatefulWidget {
  const LanguageMenuWidget({super.key});

  @override
  State<LanguageMenuWidget> createState() => _LanguageMenuWidgetState();
}

class _LanguageMenuWidgetState extends State<LanguageMenuWidget> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      initialValue: selectedMenu,
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.English,
          child: Text('English'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.French,
          child: Text('French'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.Spanish,
          child: Text('Spanish'),
        ),
      ],
    );
  }
}
