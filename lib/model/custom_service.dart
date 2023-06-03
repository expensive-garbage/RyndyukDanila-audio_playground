import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:audio_playground/model/custom_model.dart';

class CustomService {
  // static const _url = 'http://192.168.0.102:5000/';
  static const _url = 'https://51b9-92-124-163-206.ngrok-free.app/';
  static String STTAudioPath = '/data/user/0/com.example.audio_playground/cache/audio';
  // static File STTAudioFile;
  final dio = Dio();

  Future<Response> getResponse() async {
    return await dio.get(_url);
  }

  Future<String> getCustomModel() async {
    Response response = await getResponse();
    CustomModel customModel = CustomModel.fromJson(response.data);
    return customModel.main ?? '';
  }

  static predictSTT(String filePath) async {
    STTAudioPath = filePath;
    final dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    Map<String, List<String>>? headers = {
      'Content-type': ['application/json'],
      'Accept': ['application/json']
    };

    final STTFormData = FormData.fromMap({
      'name': 'dio',
      'date': DateTime.now().toIso8601String(),
      'speech-language': 'ru-RU',
      'file': await MultipartFile.fromFile(STTAudioPath, contentType: MediaType('audio', 'm4a'), headers: headers),
    });
    try {
      final response = await dio.post('$_url/STT', data: STTFormData);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  static predictTTS(String text) async {
    final dio = Dio();
    final TTSFormData = FormData.fromMap({
      'name': 'dio',
      'date': DateTime.now().toIso8601String(),
      'text-language': 'en',
      'text': 'I am testing flask server',
    });
    try {
      final response = await dio.post('$_url/TTS', data: TTSFormData);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  // response = await dio.download(
  //   'https://pub.dev/',
  //   (await getTemporaryDirectory()).path + 'pub.html',
  // );

  // Map<String, dynamic> result = jsonDecode(response.data);
  // var resultx = jsonDecode(json.encode(response.data));
  // var pred = "${resultx['emotion']}";
  // // resultx.clear();
  // return pred;
}
