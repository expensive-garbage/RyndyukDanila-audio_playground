import 'package:audio_playground/model/custom_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SpeechToTextNotifier extends ChangeNotifier {
  String STTpath = '';
  String STTtext = '';
  bool isLoading = false;

  SpeechToTextNotifier() {
    clearSTTtext();
  }

  getPredict(String path) async {
    isLoading = true;
    notifyListeners();

    STTpath = path;
    try {
      Response response = await CustomService.predictSTT(path);
      STTtext = response.data['STTtext'];
    } catch (e) {
      print(e);
      STTtext = 'Error';
    }

    isLoading = false;
    notifyListeners();
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  clearSTTtext() {
    STTtext = 'Today is ${_formatNumber(DateTime.now().day)}.${_formatNumber(DateTime.now().month)}.${DateTime.now().year}';
    notifyListeners();
  }
}
