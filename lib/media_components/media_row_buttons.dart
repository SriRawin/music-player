import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaButtonsRow extends StatelessWidget {
  final Function onPressPreviousButton;
  final Function onPressPausePlayButton;
  final Function onPressNextButton;
  final IconData pauseAndplay;
  MediaButtonsRow(
      {this.onPressPausePlayButton,
      this.pauseAndplay,
      this.onPressNextButton,
      this.onPressPreviousButton});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.skip_previous,
            size: 30,
            color: Colors.grey[400],
          ),
          onPressed: onPressPreviousButton,
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(247, 4, 85, 0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(247, 4, 85, 1),
                ),
                child: GestureDetector(
                  onTap: onPressPausePlayButton,
                  child: Icon(
                    pauseAndplay,
                    size: 40,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.skip_next, size: 30, color: Colors.grey[400]),
          onPressed: onPressNextButton,
        ),
      ],
    );
  }
}
