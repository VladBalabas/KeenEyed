import 'package:flutter/material.dart';

import 'font.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final double width;
  final double height;
  final IconData icon;
  final String text;
  const MyButton({super.key, required this.onTap, required this.height, required this.width, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
            child: Center(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 104, 35, 35), width: 2),
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFE1F0C4)
                ),
                padding: EdgeInsets.all(10),
                child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text, style: myFont.copyWith(color: Colors.black),),
                  Icon(icon, color: Colors.black,size: 23,)
                ]
              ), 
                ),
            )
            );
  }
}