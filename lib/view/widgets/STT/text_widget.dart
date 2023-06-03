import 'package:audio_playground/controller/STT_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SpeechToTextNotifier>(
      builder: (context, SpeechToTextNotifier STTnotifier, child) {
        return ListView(
          shrinkWrap: true,
          children: [
            const Text(
              'Did you say this?',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            STTnotifier.isLoading
                ? Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '${STTnotifier.STTtext}',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                            backgroundColor: Colors.black12,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
