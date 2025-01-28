import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ไปหน้าที่สอง'),
          onPressed: () {
            // กลับไปที่หน้าแรก (หน้าหลัก)
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
