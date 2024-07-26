import 'package:flutter/material.dart';

class CustomTaskWidget extends StatefulWidget {
  final VoidCallback onPressed;

  CustomTaskWidget({required this.onPressed});

  @override
  _CustomTaskWidgetState createState() => _CustomTaskWidgetState();
}

class _CustomTaskWidgetState extends State<CustomTaskWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -15,
            blurRadius: 20,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text widget'ı, belirli bir boyutta ve Poppins fontu ile
          Text(
            "data",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              color: Colors.black.withOpacity(isChecked ? 0.5 : 1.0),
            ),
          ),
          // GestureDetector, tıklanabilir bir alan sağlar
          GestureDetector(
            onTap: () {
              // Checkbox'ın durumunu değiştirmek için
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              // Checkbox'ın boyutunu belirler
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // Checkbox'ın arka plan rengini belirler
                color: isChecked ? Colors.green.withOpacity(0.5) : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              // Checkbox seçili olduğunda gösterilecek işaret
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
