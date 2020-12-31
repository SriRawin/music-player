import 'package:flutter/material.dart';
import 'package:musicplayer/screens/back_screens/song_data.dart';
import 'package:musicplayer/screens/back_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/back_screens/song_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SongData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          accentColor: Color.fromRGBO(247, 4, 85, 1),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
