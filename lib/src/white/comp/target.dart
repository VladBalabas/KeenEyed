import 'package:flutter/material.dart';

class Target extends StatelessWidget {
  final double targetX;
  final double targetY;
  final double targetHeight;
  final double targetWidth;
  final bool targetBroken;
  final double targetSizeX;
  final double targetSizeY;
  Target(
      {required this.targetHeight,
      required this.targetWidth,
      required this.targetX,
      required this.targetY,
      required this.targetBroken,
      required this.targetSizeX,
      required this.targetSizeY
      }
    );


  @override
  Widget build(BuildContext context) {
    return targetBroken
    ?Container()
    :Container(
      alignment: Alignment((2*targetX+targetWidth)/(2-targetWidth), targetY),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: targetSizeY,
          width: targetSizeX,
          child: Image.asset('assets/target1.png', fit: BoxFit.cover,),
        ),
      ),
    );
    
  }
}