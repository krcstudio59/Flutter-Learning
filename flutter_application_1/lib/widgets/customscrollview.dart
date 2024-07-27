import 'package:flutter/material.dart';
import 'CustomTaskWidget.dart';  // CustomTaskWidget import edildi
import 'BlurPage.dart';  // Popup için BlurPage import edildi

void main() => runApp(const CustomScrollViewExampleApp());

class CustomScrollViewExampleApp extends StatelessWidget {
  const CustomScrollViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Debug banner'ı kaldır
      home: CustomScrollViewExample(),
    );
  }
}

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  List<String> items = [];  // İtemler için string tipinde bir liste

  void blurCall() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Popup("Add a new task", onSubmit: (String value) {
          setState(() {
            items.add(value);  // Popup'tan gelen değeri listeye ekliyoruz
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),  // Her öğe için benzersiz bir anahtar oluştur
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);  // Öğeyi sil
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task dismissed')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: CustomTaskWidget(text: items[index], onPressed: () {}),  // CustomTaskWidget kullanımı
                );
              },
              childCount: items.length,  // Listede kaç eleman olduğu
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: blurCall,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
