
import 'package:flutter/material.dart';
import 'package:keen_eyed/src/white/comp/components/my_button.dart';
import 'package:keen_eyed/src/white/comp/components/sound_manager.dart';
import 'package:keen_eyed/src/white/initial_page.dart';

// ignore: must_be_immutable
class PauseDialog extends StatefulWidget {
  bool isPaused;
  final VoidCallback unPause;
  final Function()? resetGame;
  final BuildContext context;
  final SoundManager soundManager;
  PauseDialog({
    required this.resetGame, 
    required this.isPaused, 
    required this.unPause, 
    required this.context,
    required this.soundManager
    });

  @override
  State<PauseDialog> createState() => _PauseDialogState();
}

class _PauseDialogState extends State<PauseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 20,
        height: 200,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF662E1C),
          border: Border.all(color: Color.fromARGB(255, 78, 36, 22), width: 4 ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              onTap: () {
                widget.unPause();
                Navigator.pop(context);
              }, 
              icon: Icons.play_arrow,
              text: 'Continue',  
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
    );
  }
}