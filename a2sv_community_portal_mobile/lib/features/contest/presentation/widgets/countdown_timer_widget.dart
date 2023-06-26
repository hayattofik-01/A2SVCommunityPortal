import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime targetDateTime;

  CountdownTimerWidget({required this.targetDateTime});

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Timer _timer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeRemaining = widget.targetDateTime.difference(DateTime.now());
        if (_timeRemaining.isNegative) {
          _timeRemaining = Duration.zero;
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeRemaining.inDays;
    final hours = _timeRemaining.inHours % 24;
    final minutes = _timeRemaining.inMinutes % 60;
    final seconds = _timeRemaining.inSeconds % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeSegment("Days", days),
        const SizedBox(width: 10,),
        _buildTimeSegment("Hours", hours),
        const SizedBox(width: 10,),
        _buildTimeSegment("Minutes", minutes),
        const SizedBox(width: 10),
        _buildTimeSegment("Seconds", seconds),
      ],
    );
  }

  Widget _buildTimeSegment(String label, int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Color.fromRGBO(0, 0, 0, 1)),),
        Text(
          value.toString().padLeft(2, '0'),
         
          style: const TextStyle(fontSize: 36, color: Color.fromRGBO(77, 76, 89, 1)),
        ),
      ],
    );
  }
}