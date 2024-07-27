import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomElevatedButton.dart';

class BottomFloatingBar extends StatefulWidget {
  final VoidCallback onPressed;

  BottomFloatingBar({required this.onPressed});

  @override
  _BottomFloatingBarState createState() => _BottomFloatingBarState();
}

class _BottomFloatingBarState extends State<BottomFloatingBar> 
{
  bool isChecked = false;

  @override
  Widget build(BuildContext context) 
  {
    return Container(
        decoration: const BoxDecoration
        (
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(100))
        ),
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 100,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
          [
            const Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Text("data"),
                Text("data")
              ],
            ),
            CustomElevatedButton(onPressed: widget.onPressed),
          ],
        ),
      );
  }
}