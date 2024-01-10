import 'package:flutter/material.dart';

class Bow extends StatelessWidget {
  final bowX;
  final bowWidth;
  final bool hasGameStarted;
  Bow({this.bowX, this.bowWidth, required this.hasGameStarted});

  @override
  Widget build(BuildContext context) {
    
    return hasGameStarted
    ? Container(
      alignment: Alignment((2*bowX+bowWidth)/(2-bowWidth), 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width * bowWidth / 2,
          //color: Colors.grey,
          child:
            //? Image.asset('assets/bow.png', fit: BoxFit.cover)
            Image.asset('assets/bow_empty.png', fit: BoxFit.cover)
        ),
      ),
    )
    :Container();
  }

}