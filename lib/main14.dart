/* Container adalah widget yang digunakan untuk melakukan styling, membuat sebuah shape (bentuk), 
dan layout pada widget child-nya.  */
import 'package:flutter/material.dart';

void main() => runApp(const Contain());

class Contain extends StatelessWidget {
  const Contain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materi Container',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Contein(),
    );
  }
}

class Contein extends StatefulWidget {
  const Contein({super.key});

  @override
  State<Contein> createState() => _ConteinState();
}

class _ConteinState extends State<Contein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Container'),
      ),
      body: Container(
          // color: Colors.black,
          // // width: 300,
          // // height: 300,
          // padding: const EdgeInsets.all(20),
          // // Padding merupakan jarak antara konten (child) dengan Container,
          // // sedangkan margin merupakan jarak antara Container dengan bagian luar container.
          // margin: const EdgeInsets.all(15),
          // child: const Text(
          //   'Ini adalah Container',
          //   style: TextStyle(fontSize: 15, color: Colors.white),
          // ),

          /* Dekoration Container */
          decoration: BoxDecoration(
            color: Colors.red,
            // shape: BoxShape.circle,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black,
            //     blurRadius: 20,
            //     offset: Offset(0, 10),
            //     // blurStyle:
            //   )
            // ]

            border: Border.all(color: Colors.black, width: 10),
            borderRadius: BorderRadius.circular(10),
          ),
          // constraints: const BoxConstraints(
          //   // minHeight: 100,
          //   maxHeight: 100,
          //   maxWidth: 100
          // ),
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Ini adalah widget Center dibukus oleh widget padding dan container',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
