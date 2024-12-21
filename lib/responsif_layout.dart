/* 
MediaQuery
MediaQuery adalah kelas yang dapat kita gunakan untuk mendapatkan ukuran dan juga orientasi layar.
 */

import 'package:flutter/material.dart';
import 'package:myapp/list_view.dart';

class MediaQueryWidget extends StatelessWidget {
  const MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Screen Width: ${screenSize.width.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            'Orentation: $orientation',
            style: const TextStyle(color: Colors.red, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("MediaQuery Example")),
      body: Center(
        child: Container(
          width: screenWidth * 0.5, // 50% dari lebar layar
          height: screenHeight * 0.3, // 30% dari tinggi layar
          color: Colors.blue,
          child: const Center(child: Text("Responsif!")),
        ),
      ),
    );
  }
}

/* 
 LayoutBuilder
 Cara lain yang bisa kita gunakan adalah dengan widget LayoutBuilder. 
 Perbedaan umum antara MediaQuery dan Layout Builder adalah MediaQuery akan mengembalikan ukuran layar yang digunakan,
 sedangkan LayoutBuilder mengembalikan ukuran maksimum dari widget tertentu
 */

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'LayoutBuilder: ${constraints.maxWidth}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'LayoutBuilder: ${constraint.maxWidth}',
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* 
Perbandingan MediaQuery vs LayoutBuilder
Aspek	- MediaQuery - LayoutBuilder
Fokus =>	Ukuran layar perangkat. -	Ukuran ruang yang tersedia dari parent.
Responsivitas =>	Berdasarkan ukuran layar secara global. -	Berdasarkan ruang lokal yang diberikan.
Kegunaan =>	Cocok untuk proporsi layar. -	Cocok untuk desain yang bergantung pada ukuran parent.
Contoh Kasus =>	Membuat tata letak berdasarkan lebar layar perangkat. -	Menyesuaikan widget di dalam container fleksibel.
 */

class CombinedExample extends StatelessWidget {
  const CombinedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Combined Example")),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isWideScreen = screenWidth > 600; // Gunakan MediaQuery

          return Center(
            child: Container(
              width: isWideScreen
                  ? 600
                  : constraints.maxWidth *
                      0.8, // Kombinasi MediaQuery & LayoutBuilder
              height: 200,
              color: isWideScreen ? Colors.blue : Colors.red,
              child: Center(
                child: Text(
                  isWideScreen ? "Layar Lebar" : "Layar Kecil",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LayoutBuilder Example")),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Mengambil ukuran maksimal dari parent widget
          double width = constraints.maxWidth;

          return Center(
            child: Container(
              width: width > 600
                  ? 600
                  : width * 0.8, // Responsif berdasarkan ukuran parent
              height: 200,
              color: Colors.green,
              child: const Center(
                child: Text(
                  "Ukuran container disesuaikan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* 
Dengan mendapatkan ukuran lebar dan tinggi layar seperti di atas, 
kita bisa menentukan tampilan konten berdasarkan ukuran layar yang digunakan. 
Dalam responsive design, terdapat breakpoint yang merupakan “titik” di mana layout akan beradaptasi untuk memberikan pengalaman pengguna sebaik mungkin.
 */

class ResponsifWidget extends StatelessWidget {
  const ResponsifWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layout Responsif',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          if (constraint.maxWidth < 600) {
            return ListView(
              children: _generate(),
            );
          } else if (constraint.maxWidth < 900) {
            return GridView.count(crossAxisCount: 2, children: _generate());
          } else {
            return GridView.count(
              crossAxisCount: 6,
              children: _generate(),
            );
          }
        },
      ),
    );
  }
}

List<Widget> _generate() {
  return List<Widget>.generate(
    20,
    (index) {
      return Container(
        margin: const EdgeInsets.all(8),
        color: Colors.cyan,
        height: 200,
      );
    },
  );
}
