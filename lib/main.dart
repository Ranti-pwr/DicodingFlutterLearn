/* Wisata Alam Semesta */

import 'package:flutter/material.dart';
import 'package:myapp/detail_screen.dart';
import 'package:myapp/list_view.dart';
import 'package:myapp/responsif_layout.dart';
import 'package:myapp/tourism_place.dart';

void main() => runApp(const Wisata());

class Wisata extends StatelessWidget {
  const Wisata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Japan Tourism",
      theme: ThemeData(
          // fontFamily: 'Oswald' // Membuat Font Default
          ),
      home: const MainScreen(),
      // home: const DetailScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Japan Tourism',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const Torism();
          } else if (constraints.maxWidth <= 1200) {
            return const TourismGrid(
              gridcount: 4,
            );
          } else {
            return const TourismGrid(
              gridcount: 6,
            );
          }
        },
      ),
    );
  }
}

class TourismGrid extends StatelessWidget {
  final int gridcount;
  const TourismGrid({required this.gridcount, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridcount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: torismPlaceList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      place.location,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Torism extends StatelessWidget {
  const Torism({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: torismPlaceList.length,
      itemBuilder: (context, index) {
        final TourismPlace place = torismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  place: place,
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.network(
                    // 'https://plus.unsplash.com/premium_photo-1675714692779-0c451bbd796a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    place.imageUrl.join(' '),
                    fit: BoxFit.cover,
                    height: 120.0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          place.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(place.location),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: torismPlaceList.length,
    );
  }
}

/* Materi Image */
class MateriImage extends StatefulWidget {
  const MateriImage({super.key});

  @override
  State<MateriImage> createState() => _MateriImageState();
}

class _MateriImageState extends State<MateriImage> {
  @override

  // Image.asset
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Image.asset('assets/n.jpg', width: 200, height: 200),
      ),
    );
  }

  // Image.network
  // Untuk menampilkan gambar yang bersumber dari internet, kita akan menggunakan method Image.network.
  // Pada kode di atas kita panggil method Image.network dengan url https://picsum.photos/200/300 lalu beri width dan height masing-masing 200.
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('First Screen'),
  //     ),
  //     body: Center(
  //       child: Image.network(
  //         'https://picsum.photos/200/300/',
  //         width: 200,
  //         height: 200,
  //       ),
  //     ),
  //   );
  // }
}

/* Materi Input Widget */

class Tes extends StatefulWidget {
  const Tes({super.key});

  @override
  State<Tes> createState() => TesState();
}

class TesState extends State<Tes> {
  String _jeneng = ''; // with onChange
  final TextEditingController _controller =
      TextEditingController(); // with Controller

  bool lightOn = false;
  String? language;
  bool agree = false;

  @override
  void dispose() {
    // Ketika menggunakan controller, pastikan untuk menghapus controller ketika halaman atau widget sudah tidak digunakan.
    //  Ini bertujuan supaya tidak menimbulkan kebocoran memori (memory leak).
    _controller.dispose();
    super.dispose();
  }

  @override
  // Checkbox merupakan inputan benar atau salah.
  // Checkbox akan berisi centang jika nilainya adalah benar dan kosong jika salah.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: ListTile(
        leading: Checkbox(
          value: agree,
          onChanged: (bool? value) {
            setState(() {
              agree = value!;
            });
          },
        ),
        title: Text('Agree / Disagree'),
      ),
    );
  }

  // Radio merupakan inputan yang digunakan untuk memilih salah satu dari beberapa pilihan dalam suatu kelompok.
  // Pada contoh tersebut terdapat variable language yang digunakan pada groupValue tiap Radio. Language inilah yang menyimpan nilai Radio yang dipilih.
  // Nilainya akan berubah ketika fungsi onChanged terpanggil.
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('First Screen'),
  //     ),
  //     body: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         ListTile(
  //           leading: Radio<String>(
  //             value: 'Dart',
  //             groupValue: language,
  //             onChanged: (String? value) {
  //               setState(() {
  //                 language = value;
  //                 showSnackbar();
  //               });
  //             },
  //           ),
  //           title: Text('Dart'),
  //         ),
  //         ListTile(
  //           leading: Radio<String>(
  //             value: 'Kotlin',
  //             groupValue: language,
  //             onChanged: (String? value) {
  //               setState(() {
  //                 language = value;
  //                 showSnackbar();
  //               });
  //             },
  //           ),
  //           title: Text('Kotlin'),
  //         ),
  //         ListTile(
  //           leading: Radio<String>(
  //             value: 'Swift',
  //             groupValue: language,
  //             onChanged: (String? value) {
  //               setState(() {
  //                 language = value;
  //                 showSnackbar();
  //               });
  //             },
  //           ),
  //           title: Text('Swift'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void showSnackbar() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('$language selected'),
  //       duration: Duration(seconds: 1),
  //     ),
  //   );
  // }

// Switch merupakan inputan yang mengembalikan nilai boolean true atau false.
// Pada contoh tersebut value dari Switch berupa boolean di mana ketika boolean tersebut false maka Switch akan berada pada posisi nonaktif.
// Switch umumnya digunakan sebagai konfigurasi on/off pada halaman setting.
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('First Screen'),
  //     ),
  //     body: Switch(
  //       value: lightOn,
  //       onChanged: (bool value) {
  //         setState(() {
  //           lightOn = value;
  //         });

  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(lightOn ? 'Light On' : 'Light Off'),
  //             duration: Duration(seconds: 1),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Tes'),
  //     ),
  //     body: Center(
  //       // Inputan di flutter
  //       child: TextField(
  //         controller: _controller,
  //         decoration: const InputDecoration(
  //           border: OutlineInputBorder(),
  //           hintText: 'Masukkan Jeneng Anda',
  //         ),
  //         // onChanged: (String s) {
  //         //   setState(() {
  //         //     _jeneng = s;
  //         //   });
  //         // },
  //       ),
  //     ),
  //   );
  // }
}
