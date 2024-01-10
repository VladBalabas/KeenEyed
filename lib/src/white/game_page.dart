import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:keen_eyed/src/white/comp/arrow.dart';
import 'package:keen_eyed/src/white/comp/components/sound_manager.dart';
import 'package:keen_eyed/src/white/comp/score.dart';
import 'package:keen_eyed/src/white/comp/start_button.dart';

import 'comp/components/targets.dart';
import 'comp/pause_dialog.dart';
import 'comp/target.dart';
import 'comp/bow.dart';
import 'comp/gameover_dialog.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

enum direction { UP, DOWN, LEFT, RIGHT, STOP }

class _GamePageState extends State<GamePage> {
  var arrowYDirection = direction.UP;
  double arrowX = 0;
  double arrowY = 0;
  double arrowWidth = 0.05;
  double arrowHeight = 0.115;
  double arrowYIncrements = 0.02;

  var bowXDirection = direction.LEFT;
  double bowX = 0;
  double bowY = 0.9;
  double bowWidth = 0.4;
  double bowXIncrements = 0.02;
  bool bowIsMoving = false;
  bool changeSprite = false;

  static double targetWidth = 0.4;
  static double targetHeight = 0.03;
  bool targetBroken = false;
  double minTargetSize = 30;
  double targetSize = 100;

  int index = 0;
  int score = 0;
  int highScore = 0;

  bool hasGameStarted = false;
  bool isGameOver = false;
  bool isPaused = false;
  Timer clock=Timer.periodic(Duration(milliseconds: 10), (timer) { });
  Random random = Random();

  SoundManager soundManager = SoundManager();

  List myTargets = [];
  @override
  void initState() {
    myTargets = Targets.targets;
    bowX = -bowWidth / 2;
    arrowX = bowX + bowWidth / 2 - arrowWidth / 2;
    arrowY = bowY;
    index = random.nextInt(myTargets.length);
    super.initState();
  }

  void startGame() {
    hasGameStarted = true;
    bowIsMoving = true;
    clock=Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        if (!isPaused) {
          moveBow();
        }
        if (!bowIsMoving&&!isPaused) {
          shootArrow();
        }

        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return GameOverDialog(
                  isGameOver: isGameOver,
                  resetGame: resetGame,
                  context: context,
                  soundManager: soundManager,
                );
              });
        }
        

        if (myTargets[index][2]) {
          updateDependencies();
          createTarget();
          arrowY = bowY;
          bowXDirection = direction.LEFT;
          bowIsMoving = true;
          moveBow();
        }
        checkForBrokenTargets();
      });
    });
  }
  @override
  void dispose() {
    clock.cancel();
    super.dispose();
  }
  void resetGame() {
    setState(() {
      isGameOver = false;
      hasGameStarted = false;
      myTargets = Targets.targets;
      bowX = -bowWidth / 2;
      arrowX = bowX + bowWidth / 2 - arrowWidth / 2;
      arrowY = bowY;
      bowXDirection = direction.LEFT;
      targetSize = 100;
      bowXIncrements = 0.02;
      if (score > highScore) {
        highScore = score;
      }
      score = 0;
    });
  }

  void createTarget() {
    setState(() {
      index = random.nextInt(myTargets.length);
      if (myTargets[index][2]) {
        index = random.nextInt(myTargets.length);
      }
    });
  }

  void updateDependencies() {
    setState(() {
      if (minTargetSize != targetSize) {
        targetSize -= 0.1;
      }
      bowXIncrements += 0.001;
      score++;
    });
  }

  void checkForBrokenTargets() {
    if (arrowX >= myTargets[index][0] &&
        arrowX <= myTargets[index][0] + targetWidth &&
        arrowY <= myTargets[index][1] + targetHeight &&
        myTargets[index][2] == false) {
      setState(() {
        myTargets[index][2] = true;
      });
    }
  }

  bool isPlayerDead() {
    if (arrowY <= -2) {
      return true;
    }
    return false;
  }

  void moveBow() {
    setState(() {
      if (bowXDirection == direction.LEFT) {
        arrowX -= bowXIncrements;
        bowX -= bowXIncrements;
        if (bowX <= -1) {
          bowXDirection = direction.RIGHT;
        }
      } else if (bowXDirection == direction.RIGHT) {
        arrowX += bowXIncrements;
        bowX += bowXIncrements;
        if (bowX + bowWidth >= 1) {
          bowXDirection = direction.LEFT;
        }
      }
    });
  }

  void stopBow() {
    bowIsMoving = false;
    bowXDirection = direction.STOP;
  }

  void shootArrow() {
    setState(() {
      if (arrowYDirection == direction.UP) {
        arrowY -= arrowYIncrements;
      }
    });
  }

  void pauseGame() {
    setState(() {
      bowXDirection = direction.STOP;
      arrowYDirection = direction.STOP;
    });
  }
  void unPause(){
    setState(() {
      isPaused=false;
      if (bowIsMoving) {
      bowXDirection = direction.LEFT; 
    }
    if (!bowIsMoving && arrowYDirection == direction.UP) {
      arrowYDirection = direction.UP;
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: null,
      onTap: hasGameStarted && bowIsMoving ? stopBow : startGame,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
              child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/backgrounds/background1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Score(score: score, highScore: highScore),
              Bow(
                bowX: bowX,
                bowWidth: bowWidth,
                hasGameStarted: hasGameStarted,
              ),
              
              Target(
                targetHeight: targetHeight,
                targetWidth: targetWidth,
                targetX: myTargets[index][0],
                targetY: myTargets[index][1],
                targetBroken: myTargets[index][2],
                targetSizeX: targetSize,
                targetSizeY: targetSize,
              ),
              Arrow(
                arrowX: arrowX,
                arrowY: arrowY,
                arrowWidth: arrowWidth,
                arrowHeight: arrowHeight,
                hasGameStarted: hasGameStarted,
              ),

              StartButton(
                hasGameStarted: hasGameStarted, 
                startGame: () {}
              ),
              
              hasGameStarted
                  ? Container(
                      alignment: Alignment(0.9, -0.97),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPaused=true;
                          });
                          showDialog
                          (
                              context: context,
                              
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return PauseDialog(
                                  resetGame: resetGame,
                                  isPaused: isPaused,
                                  unPause: unPause,
                                  context: context,
                                  soundManager: soundManager,
                                );
                              });
                        },
                        icon: Icon(
                          Icons.pause,
                          size: 40,
                          color: Colors.white,
                        ),
                      ))
                  : Container()
            ],
          )),
        ),
      ),
    );
  }
}
