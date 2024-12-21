import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  // Widget ini digunakan untuk menampilkan beberapa item dalam bentuk baris atau kolom dan bisa di-scroll.
  /* 
  6. Tips dan Best Practices
    Gunakan ListView.builder untuk jumlah data yang besar untuk menghindari masalah performa.
    Gunakan shrinkWrap: true jika ListView berada di dalam widget yang scrollable (misalnya, Column dengan ScrollView).
    Gunakan physics untuk menciptakan pengalaman scroll yang sesuai dengan kebutuhan aplikasi.
   */
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: ListView.separated(
            /* 
           ListView jenis ini akan menampilkan daftar item yang dipisahkan dengan separator. 
           Penggunaan ListView.separated mirip dengan builder, yang membedakan adalah terdapat satu parameter tambahan wajib yaitu separatorBuilder yang mengembalikan Widget yang akan berperan sebagai separator.
           */
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    '${numberList[index]}',
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(), // Garis pemisah
            itemCount: numberList.length)

        // ListView.builder(
        //   // cocok digunakan pada ListView dengan jumlah item yang cukup besar.
        //   // Ini karena Flutter hanya akan merender tampilan item yang terlihat di layar dan tidak me-render seluruh item ListView di awal.
        //   //  Parameter itemBuilder merupakan fungsi yang mengembalikan widget untuk ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang ingin ditampilkan.
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 250,
        //       decoration: BoxDecoration(
        //         color: Colors.grey,
        //         border: Border.all(color: Colors.black),
        //       ),
        //       child: Center(
        //         child: Text(
        //           '${numberList[index]}',
        //           style: const TextStyle(fontSize: 50),
        //         ),
        //       ),
        //     );
        //   },
        //   itemCount: numberList.length,
        // )

        // ListView(
        // Menampilkan Item Secara Dinamis
        // Caranya, masukkan variabel atau list Anda sebagai children lalu panggil fungsi map(). Fungsi map ini berguna untuk memetakan atau mengubah setiap item di dalam list menjadi objek yang kita inginkan.
        // Fungsi map ini membutuhkan satu buah parameter berupa fungsi atau lambda.
        // Karena parameter children ini membutuhkan nilai berupa list widget, maka kita perlu mengembalikan setiap item dari numberList menjadi widget yang akan ditampilkan.
        // Ubah fungsi lambda Anda menjadi seperti berikut:
        // di akhir kita perlu mengembalikan fungsi map menjadi objek List lagi dengan fungsi .toList().
        // children: numberList.map((number) {
        //   return Container(
        //     height: 250,
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: Center(
        //       child: Text(
        //         '$number', // Ditampilkan sesuai item
        //         style: const TextStyle(fontSize: 50),
        //       ),
        //     ),
        //   );
        // }).toList(),

        // <Widget>[
        //   Container(
        //     height: 250,
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '1',
        //         style: TextStyle(fontSize: 50),
        //       ),
        //     ),
        //   ),
        //   Container(
        //     height: 250,
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '2',
        //         style: TextStyle(fontSize: 50),
        //       ),
        //     ),
        //   ),
        //   Container(
        //     height: 250,
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '3',
        //         style: TextStyle(fontSize: 50),
        //       ),
        //     ),
        //   ),
        //   Container(
        //     height: 250,
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         '4',
        //         style: TextStyle(fontSize: 50),
        //       ),
        //     ),
        //   ),
        // ],
        // ),
        );
  }
}
