import 'package:flutter/material.dart';
import 'package:keen_eyed/src/white/comp/components/font.dart';

class Score extends StatefulWidget {
  final int score;
  final int highScore;


  const Score({super.key, required this.score, required this.highScore});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Your Score: ${widget.score}',
            style: myFont,
          ),
          Text(
            'Record: ${widget.highScore}',
            style: myFont,
          ),
        ],
      ),
    );
  }
}