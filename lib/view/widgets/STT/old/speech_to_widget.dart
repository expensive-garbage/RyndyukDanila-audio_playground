// import 'package:audio_playground/model/custom_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SpeechToWidget extends StatefulWidget {
//   const SpeechToWidget({super.key});

//   @override
//   State<SpeechToWidget> createState() => _SpeechToWidgetState();
// }

// class _SpeechToWidgetState extends State<SpeechToWidget> {
//   final recorder = FlutterSoundRecorder();
//   bool isRecorderReady = false;

//   @override
//   void initState() {
//     super.initState();

//     initRecorder();
//   }

//   @override
//   void dispose() {
//     recorder.closeRecorder();

//     super.dispose();
//   }

//   Future initRecorder() async {
//     final MicrophoneStatus = await Permission.microphone.request();
//     final StorageStatus = await Permission.storage.request();
//     // final ExternalStorageStatus = await Permission.manageExternalStorage.request();

//     if (MicrophoneStatus != PermissionStatus.granted) {
//       throw 'Microphone permission not granted';
//     }

//     if (StorageStatus != PermissionStatus.granted) {
//       throw 'Storage permission not granted';
//     }

//     // if (ExternalStorageStatus != PermissionStatus.granted) {
//     //   throw 'ExternalStorage permission not granted';
//     // }

//     await recorder.openRecorder();

//     isRecorderReady = true;
//     recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
//   }

//   Future record() async {
//     if (!isRecorderReady) return;

//     // Directory(path.dirname(filePath));

//     // var _codec = Codec.pcm16WAV;
//     // var tempDir = await getTemporaryDirectory();
//     // filePath = '${tempDir.path}/flutter_sound${ext[_codec.index]}';

//     await recorder.startRecorder(
//       toFile: 'audio',
//       // codec: Codec.pcm16WAV,
//       sampleRate: 44100,
//     );
//   }

//   Future stop() async {
//     if (!isRecorderReady) return;

//     final path = await recorder.stopRecorder();

//     // CustomService.STTAudioFile = File(path!);

//     CustomService.STTAudioPath = path!;

//     print('Recorded audio: $path');

//     predict();
//   }

//   Future predict() async {
//     // CustomService.predict(CustomService.STTAudioPath);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Make your record',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           StreamBuilder<RecordingDisposition>(
//             stream: recorder.onProgress,
//             builder: (context, snapshot) {
//               final duration = snapshot.hasData ? snapshot.data!.duration : Duration.zero;

//               return Text(
//                 '${duration.inSeconds} s',
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           ElevatedButton(
//             child: Icon(
//               recorder.isRecording ? Icons.stop : Icons.mic,
//               size: 35,
//             ),
//             style: ElevatedButton.styleFrom(
//               fixedSize: const Size(70, 70),
//               shape: const CircleBorder(),
//             ),
//             onPressed: () async {
//               if (recorder.isRecording) {
//                 await stop();
//               } else {
//                 await record();
//               }

//               setState(() {});
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
