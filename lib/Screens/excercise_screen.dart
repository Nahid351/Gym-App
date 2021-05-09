import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'excersicisehub_dart.dart';

class ExcerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final int seconds;
  ExcerciseScreen({this.exercises, this.seconds});
  @override
  _ExcerciseScreenState createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  bool _isCompleted = false;
  int _elapsedSecond = 0;
  Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
        playAudio();
      }
      setState(() {
        _elapsedSecond = t.tick;
      });
    });
    super.initState();
  }

  void playAudio() {
    audioCache.play('cheering.wav');
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image: AssetImage('assets/placeholder.png'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          _isCompleted != true
              ? SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                '$_elapsedSecond/${widget.seconds}',
              ),
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
