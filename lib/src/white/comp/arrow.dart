import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  
  final arrowX;
  final arrowY;
  final arrowWidth;
  final arrowHeight;
  final hasGameStarted;


  Arrow({this.arrowX, this.arrowY,this.arrowWidth, this.arrowHeight, this.hasGameStarted});
  @override
  Widget build(BuildContext context) {
    return hasGameStarted
    ?Container(
      alignment: Alignment((2*arrowX+arrowWidth)/(2-arrowWidth), (2*arrowY+arrowHeight)/(2+arrowHeight)),
      
      child: Container(
        height: MediaQuery.of(context).size.height*arrowHeight,
        width: MediaQuery.of(context).size.width*arrowWidth/2,
        //color: Colors.grey,
        child: Image.asset('assets/arrow.png', fit: BoxFit.cover,),
      ),
    )
    :Container(); 
  }
}
