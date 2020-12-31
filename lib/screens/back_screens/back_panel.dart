import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'current_playing_card.dart';
import 'package:musicplayer/screens/back_screens/library.dart';
import 'package:musicplayer/screens/back_screens/search_songs_screen.dart';
import 'package:musicplayer/screens/back_screens/songs_screen.dart';

class BackPanel extends StatefulWidget {
  @override
  _BackPanelState createState() => _BackPanelState();
}

class _BackPanelState extends State<BackPanel> {
  int currentIndex = 0;
  List tabs = [
    SongsScreen(),
    SearchSongsScreen(),
    Library(),
  ];
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          tabs[currentIndex],
          CurrentPlayingCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(46, 20, 58, .7),
        currentIndex: currentIndex,
        elevation: 5,
        iconSize: 28,
        selectedItemColor: Color.fromRGBO(247, 4, 85, 1),
        unselectedItemColor: Colors.grey[700],
        selectedFontSize: 18,
        unselectedFontSize: 14,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
            ),
            title: Text(
              'Songs',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'Search',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text(
              'Library',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
