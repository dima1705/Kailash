// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.width,
    required this.height,
    required this.targetDate,
    this.fontFamily = 'Montserrat',
    this.fontSize = 24.0,
    this.textColor = Colors.black,
    this.isBold = true,
    this.letterSpacing = 0.0,
  });

  final double width;
  final double height;
  final DateTime targetDate;
  final String fontFamily;
  final double fontSize;
  final Color textColor;
  final bool isBold;
  final double letterSpacing;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    final difference = widget.targetDate.difference(now);

    setState(() {
      if (difference.isNegative) {
        _timeLeft = Duration.zero;
      } else {
        _timeLeft = difference;
      }
    });
  }

  String _formatTime() {
    final days = _timeLeft.inDays;
    final hours = _timeLeft.inHours % 24;
    final minutes = _timeLeft.inMinutes % 60;

    final daysStr = days.toString().padLeft(2, '0');
    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');

    return '${daysStr}d : ${hoursStr}h : ${minutesStr}m';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Text(
          _formatTime(),
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: widget.fontSize,
            color: widget.textColor,
            letterSpacing: widget.letterSpacing,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
