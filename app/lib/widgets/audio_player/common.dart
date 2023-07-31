import 'dart:math';

import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: DanaTheme.paletteLightGrey,
        padding: EdgeInsets.all(DanaTheme.bodyPadding),
        height: 100,

        width: double.infinity,
        child: Stack(
          children: [
            SliderTheme(
              data: _sliderThemeData.copyWith(
                  valueIndicatorColor: DanaTheme.paletteDarkBlue,
                  thumbColor: DanaTheme.paletteDarkBlue,
                  activeTrackColor: DanaTheme.paletteDarkBlue,
                  overlappingShapeStrokeColor: Colors.yellow,
                  inactiveTrackColor: DanaTheme.paletteGreyTonesLightGrey20,
                  trackHeight: 5.0),
              child: Slider(
                min: 0.0,
                max: widget.duration.inMilliseconds.toDouble(),
                value: min(
                    _dragValue ?? widget.position.inMilliseconds.toDouble(),
                    widget.duration.inMilliseconds.toDouble()),
                onChanged: (value) {
                  setState(() {
                    _dragValue = value;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(Duration(milliseconds: value.round()));
                  }
                },
                onChangeEnd: (value) {
                  if (widget.onChangeEnd != null) {
                    widget.onChangeEnd!(Duration(milliseconds: value.round()));
                  }
                  _dragValue = null;
                },
              ),
            ),
            Positioned(
                right: 25.0,
                bottom: 0.0,
                child: Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch("$_remaining")
                            ?.group(1) ??
                        '$_remaining',
                    style: DanaTheme.textSuperSmallText(
                        DanaTheme.paletteDarkBlue))),
            Positioned(
                left: 15.0,
                bottom: 0.0,
                child: Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch("$_timing")
                            ?.group(1) ??
                        '$_timing',
                    style: DanaTheme.textSuperSmallText(
                        DanaTheme.paletteDarkBlue))),
          ],
        ));
  }

  Duration get _remaining => widget.duration - widget.position;
  Duration get _timing => widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration? duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
