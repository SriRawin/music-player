import 'package:flutter/material.dart';
import 'package:musicplayer/page_transistion.dart';
import 'package:musicplayer/screens/back_screens/song_data.dart';
import 'package:musicplayer/screens/top_screen/top_panel.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SongsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 20, 58, 1),
      body: ListView.builder(
          reverse: false,
          scrollDirection: Axis.vertical,
          itemCount: Provider.of<SongData>(context, listen: false)
              .songDataModel
              .mp3Files
              .length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(2),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color.fromRGBO(46, 20, 58, .7),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                leading: Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Provider.of<SongData>(context, listen: false)
                          .allAudio[index]
                          .metas
                          .extra['image'],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                title: Text(
                  Provider.of<SongData>(context, listen: false)
                      .allAudio[index]
                      .metas
                      .album,
                  style: TextStyle(
                      fontSize: 16,
                      shadows: <Shadow>[
                        Shadow(
                          color: Color.fromRGBO(247, 4, 85, .5),
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        ),
                      ],
                      color: Color.fromRGBO(247, 4, 85, 1),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  Provider.of<SongData>(context, listen: false)
                      .allAudio[index]
                      .metas
                      .title,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                onTap: () async {
                  await Provider.of<SongData>(context, listen: false)
                      .player
                      .open(
                        Playlist(
                            audios:
                                Provider.of<SongData>(context, listen: false)
                                    .allAudio,
                            startIndex: index),
                        showNotification: true,
                        notificationSettings: NotificationSettings(
                          seekBarEnabled: true,
                          stopEnabled: false,
                        ),
                        autoStart: true,
                        loopMode: LoopMode.playlist,
                      );

                  Navigator.push(
                    context,
                    PageTransition(
                      page: TopPanel(),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
