import 'package:flutter/material.dart';
import 'package:flutter_application_1/CustomElevatedButton.dart';
import 'package:flutter_application_1/CustomTaskWidget.dart';

/// Flutter code sample for [CustomScrollView].

void main() => runApp(const CustomScrollViewExampleApp());


class CustomScrollViewExampleApp extends StatelessWidget {
  const CustomScrollViewExampleApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //debug banner kaldırma
      home: CustomScrollViewExample(),
    );
  }
}

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];
  void testFunction(){
    setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: CustomTaskWidget(onPressed: testFunction),
                );
              },
              childCount: bottom.length,
            ),
            
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration
        (
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(100))
        ),
        width: MediaQuery.sizeOf(context).width*0.9,
        height: 100,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
          [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("data"),
                Text("data")
              ],
            ),
            CustomElevatedButton(onPressed: testFunction),
          ],
        ),
      ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
