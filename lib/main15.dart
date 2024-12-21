import 'package:flutter/material.dart';

void main() => runApp(const ARow());

class ARow extends StatelessWidget {
  const ARow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Colume(),
    );
  }
}

class Colume extends StatefulWidget {
  const Colume({super.key});

  @override
  State<Colume> createState() => _ColumeState();
}

class _ColumeState extends State<Colume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Row dan Column',
            style: TextStyle(color: Colors.black, fontSize: 10)),
        backgroundColor: Colors.brown,
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.air),
          Icon(Icons.home),
          Icon(Icons.share),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.air),
              Icon(Icons.home),
              Icon(Icons.share),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Sebuah Judul',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text('Lorem ipsum dolor sit amet'),
            ],
          )
        ],
      ),
    );
  }
}
