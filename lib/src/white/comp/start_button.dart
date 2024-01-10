import 'package:flutter/material.dart';

import 'components/font.dart';

class StartButton extends StatelessWidget {
  final Function()? startGame;
  final bool hasGameStarted;
  const StartButton({super.key, required this.hasGameStarted,required this.startGame});

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
    ? Container()
    :Container(
        alignment: Alignment(0, 0.8),
        child: GestureDetector(
          onTap: startGame,
          child: Text(
            'TAP TO PLAY',
            style: myFont.copyWith(fontSize: 30, letterSpacing: 7),
          ),
        ));
  }
}
