import 'package:flutter/material.dart';

class CustomTaskWidget extends StatefulWidget {
  final String text; // Kullanıcı girdisini göstermek için kullanılacak
  final VoidCallback onPressed; // Bir aksiyon tetiklemek için kullanılacak

  CustomTaskWidget({required this.text, required this.onPressed});

  @override
  _CustomTaskWidgetState createState() => _CustomTaskWidgetState();
}

class _CustomTaskWidgetState extends State<CustomTaskWidget> {
  bool isChecked = false; // Bu, widget'ın işaretlenip işaretlenmediğini kontrol eder

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -15,
            blurRadius: 20,
            offset: Offset(0, 3), // gölge efekti
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(100)), // yuvarlak köşeler
      ),
      width: MediaQuery.of(context).size.width * 0.9, // genişlik
      height: 80, // yükseklik
      padding: EdgeInsetsDirectional.only(start: 20, end: 20), // iç boşluk
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // içerikleri aralıkla ayırır
        children: [
          Expanded(
            child: Text(
              widget.text, // Text widget'ı kullanıcıdan alınan veriyi gösterir
              style: TextStyle(
                fontSize: 20, // font büyüklüğü
                fontFamily: 'Poppins', // font ailesi
                decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none, // üzeri çizili ya da normal
                color: Colors.black.withOpacity(isChecked ? 0.5 : 1.0), // renk ve opaklık
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked; // durumu değiştir
              });
            },
            child: Container(
              width: 50, // genişlik
              height: 50, // yükseklik
              decoration: BoxDecoration(
                color: isChecked ? Colors.green.withOpacity(0.5) : Colors.white, // arka plan rengi
                shape: BoxShape.circle, // daire şeklinde
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // gölge rengi
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // gölge efekti
                  ),
                ],
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30, // ikon boyutu
                    )
                  : Container(), // eğer işaretlenmediyse boş konteynır
            ),
          ),
        ],
      ),
    );
  }
}
