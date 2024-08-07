import 'package:flutter/material.dart';

class UITextStyles 
{
  static TextStyle weatherTextStyle = const TextStyle
  (
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 100,
    fontWeight: FontWeight.w500
  );
  static TextStyle privateStyle = const TextStyle
  (
    fontFamily: 'Montserrat',
    color: Colors.amber,
    fontSize: 45,
    fontWeight: FontWeight.w500
  );
}

//Text("login", style: UITextStyles.loginStyle))); //Bu şekilde kullanabilirsiniz.
