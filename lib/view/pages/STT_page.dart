import 'package:audio_playground/controller/STT_notifier.dart';
import 'package:audio_playground/view/widgets/STT/audio_rec_and_play_widget.dart';
import 'package:audio_playground/view/widgets/STT/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class STTPage extends StatefulWidget {
  const STTPage({super.key});

  @override
  State<STTPage> createState() => _STTPageState();
}

class _STTPageState extends State<STTPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SpeechToTextNotifier>(
      builder: (context, SpeechToTextNotifier STTnotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Speech To Text Page"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              TextWidget(),
              Divider(),
              AudioRecAndPlayWidget(),
            ],
          ),
        );
      },
    );
  }
}
