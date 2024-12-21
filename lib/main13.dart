/* Scaffold 
Scaffold adalah sebuah widget inti dalam Flutter yang menyediakan struktur dasar untuk membangun aplikasi dengan desain Material. 
Ia bertindak sebagai wadah utama untuk berbagai komponen UI seperti AppBar, Drawer, FloatingActionButton, BottomNavigationBar, dan konten utama aplikasi.
 */

import 'package:flutter/material.dart';

void main() => runApp(const Scaf());

class Scaf extends StatelessWidget {
  const Scaf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percobaan Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Less(),
    );
  }
}

class Less extends StatefulWidget {
  const Less({super.key});

  @override
  State<Less> createState() => _LessState();
}

class _LessState extends State<Less> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Flutter App',
            textAlign: TextAlign.center,
          ),
        ),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 71, 63, 63),
            fontSize: 15,
            fontWeight: FontWeight.bold),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black))
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 38, 125, 136),
      ),
      body: const Center(
        child: Text('Percobaan Kita',
            textAlign: TextAlign.center,
            selectionColor: Colors.black,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
