import 'package:flutter/material.dart';
import 'package:flutter_mp3_finder/flutter_mp3_finder.dart';
import 'package:musicplayer/screens/back_screens/back_panel.dart';
import 'package:musicplayer/screens/back_screens/song_data.dart';
import 'package:musicplayer/screens/back_screens/song_data_model.dart';
import 'dart:convert';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SongDataModel dataModel;
  void getSongs() async {
    var mp3String = await FlutterMp3Finder.scanDeviceForMp3Files;

    dataModel = SongDataModel.fromJson(jsonDecode(mp3String));
    Provider.of<SongData>(context, listen: false).songDataModel = dataModel;
    for (int index = 0; index < dataModel.mp3Files.length; index++) {
      Provider.of<SongData>(context, listen: false).albumimage =
          base64Decode(dataModel.mp3Files[index].albumImage) != null
              ? MemoryImage(base64Decode(dataModel.mp3Files[index].albumImage))
              : AssetImage('assets/kaala_HD_101325_730x419-m.jpg');
      Provider.of<SongData>(context, listen: false).path =
          dataModel.mp3Files[index].path;

      Provider.of<SongData>(context, listen: false).trackname = dataModel
          .mp3Files[index].displayName
          .replaceAll('-', ' ')
          .split('.')
          .first;
      Provider.of<SongData>(context, listen: false).albumName =
          dataModel.mp3Files[index].album.split('-').first;

      Provider.of<SongData>(context, listen: false).allAudio.add(
            Audio.file(
              Provider.of<SongData>(context, listen: false).path,
              metas: Metas(
                album: Provider.of<SongData>(context, listen: false).albumName,
                title: Provider.of<SongData>(context, listen: false).trackname,
                extra: {
                  'image':
                      Provider.of<SongData>(context, listen: false).albumimage
                },
              ),
            ),
          );
    }
    Provider.of<SongData>(context, listen: false).allAudio.sort((a, b) =>
        Provider.of<SongData>(context, listen: false)
            .allAudio[1]
            .metas
            .title
            .compareTo(Provider.of<SongData>(context, listen: false)
                .allAudio[2]
                .metas
                .title));

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BackPanel()));
  }

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(46, 20, 58, .7),
        child: Center(
          child: Icon(
            Icons.music_note,
            size: 100,
            color: Color.fromRGBO(247, 4, 85, 1),
          ),
        ),
      ),
    );
  }
}
