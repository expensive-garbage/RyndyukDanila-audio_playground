// import 'package:audio_playground/model/custom_service.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   const AudioPlayerWidget({super.key});

//   @override
//   State<AudioPlayerWidget> createState() => AudioPlayerWidgetState();

//   static void setAudio(String? path) {}
// }

// class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   @override
//   void initState() {
//     super.initState();

//     setAudio(CustomService.STTAudioPath);

//     audioPlayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isPlaying = event == PlayerState.playing;
//       });
//     });

//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duration = event;
//       });
//     });

//     audioPlayer.onPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();

//     super.dispose();
//   }

//   Future setAudio(path) async {
//     audioPlayer.setReleaseMode(ReleaseMode.loop);

//     audioPlayer.setSourceDeviceFile(path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Play your record',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//         Slider(
//           min: 0,
//           max: duration.inSeconds.toDouble(),
//           value: position.inSeconds.toDouble(),
//           onChanged: (value) async {
//             final position = Duration(seconds: value.toInt());
//             await audioPlayer.seek(position);

//             await audioPlayer.resume();
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('${position.inSeconds} s'),
//               Text('${duration.inSeconds} s'),
//             ],
//           ),
//         ),
//         CircleAvatar(
//           radius: 35,
//           child: IconButton(
//             onPressed: () async {
//               if (isPlaying) {
//                 await audioPlayer.pause();
//               } else {
//                 await audioPlayer.resume();
//               }
//             },
//             icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             iconSize: 40,
//           ),
//         )
//       ],
//     );
//   }
// }
