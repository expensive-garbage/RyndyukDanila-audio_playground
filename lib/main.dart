import 'package:audio_playground/controller/STT_notifier.dart';
import 'package:audio_playground/controller/TTS_notifier.dart';
import 'package:audio_playground/controller/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:audio_playground/model/custom_service.dart';

import 'package:provider/provider.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final CustomService service = CustomService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsNotifier>(create: (_) => SettingsNotifier()),
        ChangeNotifierProvider<SpeechToTextNotifier>(create: (_) => SpeechToTextNotifier()),
        ChangeNotifierProvider<TTSNotifier>(create: (_) => TTSNotifier()),
      ],
      child: Consumer<SettingsNotifier>(
        builder: (context, SettingsNotifier settingsNotifier, child) {
          return MaterialApp(
            title: 'Audio Playground',
            theme: settingsNotifier.isDark ? ThemeData.dark() : ThemeData(primarySwatch: Colors.purple),
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

// FutureBuilder<String>(
//             future: service.getCustomModel(),
//             builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//               List<Widget> children;
//               if (snapshot.hasData) {
//                 children = <Widget>[
//                   const Icon(
//                     Icons.check_circle_outline,
//                     color: Colors.green,
//                     size: 60,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16),
//                     child: Text('Result: ${snapshot.data}'),
//                   ),
//                 ];
//               } else if (snapshot.hasError) {
//                 children = <Widget>[
//                   const Icon(
//                     Icons.error_outline,
//                     color: Colors.red,
//                     size: 60,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16),
//                     child: Text('Error: ${snapshot.error}'),
//                   ),
//                 ];
//               } else {
//                 children = const <Widget>[
//                   SizedBox(
//                     width: 60,
//                     height: 60,
//                     child: CircularProgressIndicator(),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 16),
//                     child: Text('Awaiting result...'),
//                   ),
//                 ];
//               }
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: children,
//                 ),
//               );
//             },
//           ),