import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/media_components/media_row_buttons.dart';
import 'package:musicplayer/screens/back_screens/song_data.dart';
import 'circular_slider.dart';
import 'top_bar.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopPanel extends StatefulWidget {
  @override
  _TopPanelState createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<SongData>(context).player.builderCurrent(
          builder: (context, playing) {
        if (playing != null) {
          Provider.of<SongData>(context).myAudio =
              Provider.of<SongData>(context).find(
                  Provider.of<SongData>(context).allAudio,
                  playing.audio.assetAudioPath);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    Provider.of<SongData>(context).myAudio.metas.extra['image'],
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
              child: Container(
                color: Colors.black.withOpacity(.68),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TopBar(
                        onDownArrowTap: () {
                          Navigator.pop(context);
                        },
                        onThreeDotButtonTap: () {},
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        height: MediaQuery.of(context).size.height * 1 / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Provider.of<SongData>(context)
                                .myAudio
                                .metas
                                .extra['image'],
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
//                      CarouselSlider(
//                        items: Provider.of<SongData>(context)
//                            .myAudio
//                            .metas
//                            .extra['image'],
//                        options: CarouselOptions(
//                          enlargeCenterPage: true,
//                          scrollDirection: Axis.horizontal,
//                          height: 400,
//                        ),
//                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1 / 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  Provider.of<SongData>(context)
                                      .myAudio
                                      .metas
                                      .album,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(247, 4, 85, 1),
                                      shadows: <Shadow>[
                                        Shadow(
                                          color: Color.fromRGBO(247, 4, 85, .5),
                                          offset: Offset(2, 2),
                                          blurRadius: 3,
                                        ),
                                      ],
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontFamily: 'Montserrat',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Provider.of<SongData>(context)
                                      .myAudio
                                      .metas
                                      .title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      color: Colors.grey[400],
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Provider.of<SongData>(context).player.builderIsPlaying(
                          builder: (context, isPlaying) {
                        return Provider.of<SongData>(context)
                            .player
                            .builderRealtimePlayingInfos(
                                builder: (context, infos) {
                          if (infos == null) {
                            return SizedBox();
                          }
                          return CircularSlider(
                            max: infos.duration,
                            value: infos.currentPosition,
                            seekto: (to) {
                              Provider.of<SongData>(context, listen: false)
                                  .player
                                  .seek(to);
                            },
                            mediaControls: MediaButtonsRow(
                              onPressNextButton: () {
                                Provider.of<SongData>(context, listen: false)
                                    .player
                                    .next(
                                        stopIfLast: false, keepLoopMode: false);
                              },
                              pauseAndplay: isPlaying != true
                                  ? Icons.play_arrow
                                  : Icons.pause,
                              onPressPausePlayButton: () {
                                Provider.of<SongData>(context, listen: false)
                                    .player
                                    .playOrPause();
                              },
                              onPressPreviousButton: () {
                                Provider.of<SongData>(context, listen: false)
                                    .player
                                    .previous(
                                      keepLoopMode: false,
                                    );
                              },
                            ),
                          );
                        });
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.grey[400]),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.repeat,
                                color: Colors.grey[400],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.playlist_add,
                                color: Colors.grey[400],
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon:
                                  Icon(Icons.shuffle, color: Colors.grey[400]),
                              onPressed: () {
                                print(playing);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      }),
    );
  }
}
