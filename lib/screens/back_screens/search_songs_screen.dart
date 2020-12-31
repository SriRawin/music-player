import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'song_data.dart';

class SearchSongsScreen extends StatefulWidget {
  @override
  _SearchSongsScreenState createState() => _SearchSongsScreenState();
}

class _SearchSongsScreenState extends State<SearchSongsScreen> {
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 20, 58, 1),
      body: Container(),
    );
  }
}
