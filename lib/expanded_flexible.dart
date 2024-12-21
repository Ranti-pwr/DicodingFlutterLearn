import 'package:flutter/material.dart';

/* 
Expanded
Flutter memiliki widget Expanded yang dapat mengembangkan child dari Row atau Column sesuai dengan ruang yang tersedia. 
 
 Saat aplikasi dijalankan, masing-masing container akan menempati ruang kosong yang ada.
 Jika Anda menjalankan di ukuran layar yang berbeda, maka ukuran container juga akan menyesuaikan.

 Bisa kita lihat seluruh container menempati ruang dengan ukuran yang sama.
  Ini disebabkan Expanded memiliki parameter flex yang memiliki nilai default 1. 
  Anda dapat mengubah nilai flex ini sesuai perbandingan yang diinginkan. 



  Sama seperti Expanded, widget Flexible digunakan untuk mengatur ukuran widget di dalam Row atau Column secara fleksibel.
  Perbedaan Flexible dan Expanded adalah widget Flexible memungkinkan child widget-nya berukuran lebih kecil dibandingkan ukuran ruang yang tersisa.
  Sementara, child widget dari Expanded harus menempati ruang yang tersisa dari Column atau Row.
 */
class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
