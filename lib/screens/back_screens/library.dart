import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(46, 20, 58, .7),
      child: Center(
        child: Text('LIBRARY'),
      ),
    );
  }
}
