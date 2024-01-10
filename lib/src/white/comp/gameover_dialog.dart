
import 'package:flutter/material.dart';
import 'package:keen_eyed/src/white/comp/components/font.dart';
import 'package:keen_eyed/src/white/comp/components/sound_manager.dart';

import '../initial_page.dart';
import 'components/my_button.dart';

class GameOverDialog extends StatefulWidget {
  
  final bool isGameOver;
  final Function()? resetGame;
  final BuildContext context;
  final SoundManager soundManager;
  GameOverDialog({required this.isGameOver, required this.resetGame, required this.context, required this.soundManager});

  @override
  State<GameOverDialog> createState() => _GameOverDialogState();
}

class _GameOverDialogState extends State<GameOverDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.isGameOver
    ? Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 20,
        height: 250,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF662E1C),
          border: Border.all(color: Color.fromARGB(255, 78, 36, 22), width: 4 ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
            Text('G A M E  O V E R :(', style: myFont.copyWith(fontSize: 28),),
            Text(''),
            MyButton(
              onTap: () {
                widget.resetGame!();
                Navigator.pop(context);
              }, 
              icon: Icons.restart_alt,
              text: 'Restart',  
              height: 40, 
              width: double.infinity
            ),
            MyButton(
              onTap: () {
                setState(() {
                  widget.soundManager.toggleSound();
                });
              }, 
              icon: widget.soundManager.isSoundOn? Icons.music_note :Icons.music_off_rounded,
              text: 'Sound',  
              height: 40, 
              width: double.infinity
            ),
            MyButton(
              onTap: () {
                Navigator.pop(context);
                  Navigator.pushReplacement(widget.context, MaterialPageRoute(builder: (context)=>InitialPage()));
              }, 
              icon: Icons.menu,
              text: 'Menu',  
              height: 40, 
              width: double.infinity
            ),
          ],
        ),
      ),
    )
    :Container();
  }
}