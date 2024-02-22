import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class RemainingTimeCountdown extends StatelessWidget {

  String endTime;
  RemainingTimeCountdown({required this.endTime});

  @override
  Widget build(BuildContext context) {
    // Get current time
    DateTime now = DateTime.now();

    DateTime endedTime = DateTime.parse(endTime);

    // Calculate remaining time until end time
    Duration remainingTime = endedTime.difference(now);

    return Expanded(
      child: Center(
        child: CountdownTimer(
          endTime: endedTime.millisecondsSinceEpoch,
          textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          onEnd: () {
            print('Countdown ended!');
          },
        ),
      ),
    );
  }
}