import 'package:audio_playground/model/custom_service.dart';
import 'package:flutter/material.dart';

class TTSNotifier extends ChangeNotifier {
  static String TTStext = '';
  bool isLoading = true;

  getPredict(String text) async {
    isLoading = true;
    notifyListeners();

    TTStext = text;
    await CustomService.predictTTS(text);

    isLoading = false;
    notifyListeners();
  }
}
