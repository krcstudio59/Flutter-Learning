import 'dart:ui';
import 'package:flutter/material.dart';

var buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.all(8),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
);

class Popup extends StatelessWidget {
  final String message;
  final Function(String) onSubmit;

  final TextEditingController controller = TextEditingController();

  Popup(this.message, {Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(),
              ),
            ),
          ),
          Center
          (
            child: Container
            (
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration
              (
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding
              (
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column
                (
                  mainAxisSize: MainAxisSize.min,
                  children: 
                  [
                    Text(
                      message,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter your input here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {
                        onSubmit(controller.text);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
