import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const MyIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.grey,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 30,
              color: Colors.white,
            )),
      ),
    );
  }
}
