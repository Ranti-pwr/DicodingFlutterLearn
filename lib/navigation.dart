/* 
Kita telah bisa membuat satu tampilan screen (layar/page) pada pembelajaran sebelumnya.
 Namun, pada saat membangun sebuah aplikasi kita akan membuat banyak sekali screen dan kita akan berpindah dari satu screen ke screen lainnya.

Dalam pemrograman Android kita mengenal Intent lalu pada pemrograman website terdapat tag untuk berpindah dari satu page ke page lain.
 Pada Flutter kita akan menggunakan sebuah class bernama Navigator. 
 Dengan Navigator ini kita akan berpindah dari satu screen ke screen lainnya.
 */
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  final String message = 'Hello from First Screen!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SeconScreen(message)));
          },
        ),
      ),
    );
  }
}

/* 
Pada kode di atas Navigator.push memiliki dua parameter. Pertama ialah context dan yang kedua Route. 
Parameter context ini merupakan variabel BuildContext yang ada pada method build.
 Parameter route berguna untuk menentukan tujuan ke mana kita akan berpindah screen. 
 Route tersebut kita isikan dengan MaterialPageRoute yang di dalamnya terdapat builder yang nantinya akan diisi dengan tujuan screen-nya.
  Maka untuk melakukan perpindahan screen kita akan membuat event onPressed pada tombol ElevatedButton yang ada pada screen pertama:
 
 Setelah dapat berpindah ke screen lain maka kita akan belajar menggunakan Navigator.pop
 */

class SeconScreen extends StatelessWidget {
  final String message;
  const SeconScreen(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          OutlinedButton(
            child: const Text('Kembali'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
