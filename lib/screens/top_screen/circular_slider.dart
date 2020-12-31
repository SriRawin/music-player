import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatefulWidget {
  final Duration value;
  final Duration max;
  final Function(Duration) seekto;
  final Widget mediaControls;
  CircularSlider({this.max, this.value, this.seekto, this.mediaControls});

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Duration _newPositon;
  @override
  void initState() {
    _newPositon = widget.value;
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.white10.withOpacity(0.14),
      shape: CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SleekCircularSlider(
          min: 0,
          initialValue: widget.value.inMilliseconds.toDouble(),
          max: widget.max.inMilliseconds.toDouble(),
          innerWidget: (double value) {
            return Center(child: widget.mediaControls);
          },
          appearance: CircularSliderAppearance(
            size: MediaQuery.of(context).size.height * 1 / 3,
            animationEnabled: true,
            startAngle: 270,
            angleRange: 360,
            customWidths: CustomSliderWidths(
              progressBarWidth: 9,
              trackWidth: 6,
              handlerSize: 8,
              shadowWidth: 60,
            ),
            customColors: CustomSliderColors(
                shadowColor: Color.fromRGBO(247, 4, 85, .1),
                shadowMaxOpacity: .1,
                trackColor: Color.fromRGBO(247, 4, 85, 0.2),
                progressBarColor: Color.fromRGBO(247, 4, 85, 1),
                dotColor: Colors.white),
          ),
          onChangeEnd: (newValue) {
            widget.seekto(_newPositon);
          },
          onChange: (newValue) {
            final to = Duration(milliseconds: newValue.floor());
            _newPositon = to;
          },
        ),
      ),
    );
  }
}
