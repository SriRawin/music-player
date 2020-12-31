import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/page_transistion.dart';
import 'package:musicplayer/screens/top_screen/top_panel.dart';
import 'song_data_model.dart';

class SongData extends ChangeNotifier {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  var myAudio;
  String trackname;
  String albumName;
  String path;
  ImageProvider albumimage;

  List<Audio> allAudio = List<Audio>();
  SongDataModel songDataModel;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }
}
