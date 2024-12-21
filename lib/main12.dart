import 'package:flutter/material.dart';

/* ini dari flutter adalah widget
State adalah data yang ada pada suatu widget.
 */

void main() => runApp(const Pretest());

class Pretest extends StatelessWidget { // Tetap
  const Pretest({super.key});
  // final String _judul;

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Pecobaan Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
          // titleTextStyle: const TextStyle(
          //   fontSize: 40,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        body: const Center(
          child: Pretes2(pretestparameter: 'ini adalah parameter contructor'),
        ),
      ),
    );
  }
}

class IniTest extends StatelessWidget {
  final String text;
  // const IniTest({required this.text, super.key});
  // const IniTest(this.text, {super.key});
  const IniTest({required this.text, super.key});

  // const IniTest
  // const IniTest({Key? key, required this.text}) : super(key: key);

/*
Sesuai definisi StatelessWidget, state-nya tidak dapat berubah (immutable),
maka state yang ada di dalam kelas tersebut harus dibuat final.
Nilainya hanya dapat diisi melalui constructor class-nya.
 */
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Pretes2 extends StatefulWidget { // berubah ubah
  final String pretestparameter;
  const Pretes2({required this.pretestparameter, super.key});

  /*
   StatefulWidget ialah widget yang state-nya dapat berubah-ubah nilainya,
   yang berarti StatefulWidget bersifat dinamis dan memiliki interaksi yang tak terbatas.
   */

  @override
  State<Pretes2> createState() => _Pretes2State();
  // State<Pretes2> createState() => _Pretes2State();
}

class _Pretes2State extends State<Pretes2> {
  // final String _pretesta = 'nama saya';
  double _textsize = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.pretestparameter,
            style: TextStyle(fontSize: _textsize, color: Colors.black),
            ),
        ElevatedButton(
          child: const Text(
            'Perbesar Teks Anda',
            style: TextStyle(color: Colors.redAccent),
          ),
          onPressed: () {
            setState(() {
              _textsize = 15;
            });
          },
        ),
      ],
    );
  }
}

// /* child hanya berlaku satu anak
// sedangkan children bisa memiliki banyak anak
// */
