import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/page_transistion.dart';
import 'package:musicplayer/screens/top_screen/top_panel.dart';
import 'package:provider/provider.dart';
import 'song_data.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class CurrentPlayingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<SongData>(context).player.builderCurrent(
        builder: (context, playing) {
      if (playing != null) {
        Provider.of<SongData>(context).myAudio = Provider.of<SongData>(context)
            .find(Provider.of<SongData>(context).allAudio,
                playing.audio.assetAudioPath);

        return Provider.of<SongData>(context).player.builderIsPlaying(
            builder: (context, isPlaying) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, PageTransition(page: TopPanel()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 1 / 11,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(46, 20, 58, 1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.07),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<SongData>(context, listen: false)
                                .player
                                .playOrPause();
                          },
                          child: Container(
                            height: 70,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15)),
                              image: DecorationImage(
                                image: Provider.of<SongData>(context)
                                    .myAudio
                                    .metas
                                    .extra['image'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.skip_previous,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              Provider.of<SongData>(context, listen: false)
                                  .player
                                  .previous(
                                    keepLoopMode: true,
                                  );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  Provider.of<SongData>(context)
                                      .myAudio
                                      .metas
                                      .album,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      shadows: <Shadow>[
                                        Shadow(
                                          color: Color.fromRGBO(247, 4, 85, .5),
                                          offset: Offset(2, 2),
                                          blurRadius: 3,
                                        )
                                      ],
                                      color: Color.fromRGBO(247, 4, 85, 1),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Provider.of<SongData>(context)
                                      .myAudio
                                      .metas
                                      .title,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.skip_next,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              Provider.of<SongData>(context, listen: false)
                                  .player
                                  .next(stopIfLast: true, keepLoopMode: true);
                            },
                          ),
                        ),
                      ],
                    ),
                    Provider.of<SongData>(context)
                        .player
                        .builderRealtimePlayingInfos(builder: (context, infos) {
                      if (infos == null) {
                        return SizedBox();
                      }
                      return SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: SliderComponentShape.noThumb,
                          overlayShape: SliderComponentShape.noOverlay,
                        ),
                        child: Slider(
                          min: 0,
                          value: infos.currentPosition.inSeconds.toDouble(),
                          max: infos.duration.inSeconds.toDouble(),
                          activeColor: Color.fromRGBO(247, 4, 85, 1),
                          inactiveColor: Colors.black,
                          onChanged: (v) {},
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        });
      }
      return SizedBox();
    });
  }
}
