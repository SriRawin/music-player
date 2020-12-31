import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Function onDownArrowTap;
  final Function onThreeDotButtonTap;
  TopBar({this.onDownArrowTap, this.onThreeDotButtonTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1 / 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MaterialButton(
            elevation: 2,
            onPressed: onDownArrowTap,
            shape: CircleBorder(),
            color: Colors.white.withOpacity(0.25), // button color
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 30,
                color: Colors.grey[400],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 35,
            color: Colors.grey,
            onPressed: onThreeDotButtonTap,
          ),
        ],
      ),
    );
  }
}
