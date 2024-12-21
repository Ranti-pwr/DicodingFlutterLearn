import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrained) {
        if (constrained.maxWidth > 800) {
          return WebPage(place: place);
        } else {
          return MobileView(place: place);
        }
      },
    );
  }
}

class WebPage extends StatelessWidget {
  final TourismPlace place;
  const WebPage({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Widget akan otomatis menyesuaikan dengan perangkatan layar
        child: SingleChildScrollView(
          // Salah satunya fungsinya adalah agar tidak terjadi overloow pada layar dengan cara adanya fitur scrolling.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(place.imageUrl.join(' ')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Favorite(),
                      ],
                    ),
                  )
                ],
              ),
              // Image.network(
              //   'https://images.unsplash.com/photo-1724497508928-14dd7894602c?q=80&w=1442&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              // ),

              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  // color: const Color(0xFFCFFFFF),
                  // SizedBox(height: 10,),
                  child: Text(
                    place.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.protestRevolution(
                      textStyle: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                // height: 50,
                // width: ,
                // decoration: BoxDecoration(
                //     color: const Color(0xFFCFFFFF),
                //     borderRadius: BorderRadius.circular(15),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: const Offset(0, 3),
                //       )
                //     ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, //
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Tanggal',
                            icon: const Icon(Icons.calendar_today)),
                        const SizedBox(height: 8.0),
                        Text(place.openDays),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Jam',
                            icon: const Icon(Icons.lock_clock_sharp)),
                        const SizedBox(height: 8.0),
                        Text(place.openTime)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Harga Masuk',
                            icon: const Icon(Icons.money_sharp)),
                        const SizedBox(height: 8.0),
                        Text(place.ticketPrice)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // 'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                  place.decription,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oxygen(
                      textStyle: const TextStyle(fontSize: 10.0)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrl.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                  // <Widget>[
                  //   Padding(
                  //     //Antar layar ada jarak dan tidak terlalu rapat
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       // memungkinkan gambar memiliki radius, yaitu ClipRRect.
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1542051841857-5f90071e7989?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1522850403397-b0c8f2f75451?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1494588024300-e9df7ff98d78?q=80&w=1368&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1481882563558-a1b9f5f7744a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   )
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  final TourismPlace place;
  const MobileView({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Widget akan otomatis menyesuaikan dengan perangkatan layar
        child: SingleChildScrollView(
          // Salah satunya fungsinya adalah agar tidak terjadi overloow pada layar dengan cara adanya fitur scrolling.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(place.imageUrl.join(' ')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Favorite(),
                      ],
                    ),
                  )
                ],
              ),
              // Image.network(
              //   'https://images.unsplash.com/photo-1724497508928-14dd7894602c?q=80&w=1442&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              // ),

              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  // color: const Color(0xFFCFFFFF),
                  // SizedBox(height: 10,),
                  child: Text(
                    place.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.protestRevolution(
                      textStyle: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                // height: 50,
                // width: ,
                // decoration: BoxDecoration(
                //     color: const Color(0xFFCFFFFF),
                //     borderRadius: BorderRadius.circular(15),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: const Offset(0, 3),
                //       )
                //     ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Tanggal',
                            icon: const Icon(Icons.calendar_today)),
                        const SizedBox(height: 8.0),
                        Text(place.openDays),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Jam',
                            icon: const Icon(Icons.lock_clock_sharp)),
                        const SizedBox(height: 8.0),
                        Text(place.openTime)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            tooltip: 'Harga Masuk',
                            icon: const Icon(Icons.money_sharp)),
                        const SizedBox(height: 8.0),
                        Text(place.ticketPrice)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // 'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                  place.decription,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oxygen(
                      textStyle: const TextStyle(fontSize: 10.0)),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrl.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                  // <Widget>[
                  //   Padding(
                  //     //Antar layar ada jarak dan tidak terlalu rapat
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       // memungkinkan gambar memiliki radius, yaitu ClipRRect.
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1542051841857-5f90071e7989?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1522850403397-b0c8f2f75451?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1494588024300-e9df7ff98d78?q=80&w=1368&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Image.network(
                  //           'https://images.unsplash.com/photo-1481882563558-a1b9f5f7744a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  //     ),
                  //   )
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isfavorite = !isfavorite;
        });
      },
      icon: Icon(
        isfavorite ? Icons.favorite : Icons.favorite_border,
        color: isfavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
