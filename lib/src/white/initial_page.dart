import 'package:flutter/material.dart';
import 'package:keen_eyed/src/white/comp/components/font.dart';
import 'package:keen_eyed/src/white/game_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/backgrounds/initial_background1.png', fit: BoxFit.fill,),
          ),
          Container(
            alignment: Alignment(0,-0.7),
            child: Container(
              child: Image.asset('assets/logo.png')
                  
            ),
          ),
          Container(
            alignment: Alignment(0,0.6),
            child: GestureDetector(
              onTap:(){ 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GamePage()));
              },
              child: Container(
                width: 160,
                height: 45,
                
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF662E1C), width:3 ),
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFC9A66B)
                ),
                child: Center(
                  child: Text(
                    'Play', 
                    style: myFont.copyWith(
                      fontSize: 30, 
                      fontWeight: FontWeight.w600,
                      letterSpacing: 8, 
                      color: Color.fromARGB(255, 248, 237, 255)

                    ),
                  )
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}