import 'package:audio_playground/controller/STT_notifier.dart';
import 'package:audio_playground/controller/TTS_notifier.dart';
import 'package:audio_playground/view/widgets/STT/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TTSPage extends StatefulWidget {
  const TTSPage({super.key});

  @override
  State<TTSPage> createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TTSNotifier>(
      builder: (context, TTSNotifier TTSnotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Text To Speech Page"),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8.0),
            children: const [
              // TTSTextWidget(),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
