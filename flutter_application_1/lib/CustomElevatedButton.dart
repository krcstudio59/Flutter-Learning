import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomElevatedButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton
    (
      onPressed: onPressed, 
      backgroundColor: Colors.black54,
      child: const Icon
      (
        Icons.add_outlined,
        color: Colors.white,
      )
    );
  }
}