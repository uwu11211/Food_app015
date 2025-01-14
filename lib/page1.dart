import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), // AppBar
      body: Center(
        child: ElevatedButton(
          child: const Text('ไปหน้าที่สอง'),
          onPressed: () {
            // เปิดหน้าที่สองเมื่อกดปุ่ม
            Navigator.pushNamed(context, '/page2');
          },
        ),
      ),
    );
  }
}
