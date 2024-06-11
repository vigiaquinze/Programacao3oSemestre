import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo2_music_player/models/music_model.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;
  const MusicPlayerScreen({Key? key, required this.music}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audio;

  @override
  void initState() {
    super.initState();
    _audio = AudioPlayer();
  }

  @override
  void dispose() {
    _audio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () async {
              await _audio.play(widget.music.url, isLocal: false);
            },
            child: const Text('Play Music'),
          ),
        ),
      ),
    );
  }
}
