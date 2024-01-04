import 'package:flutter/material.dart';

class DetailWisata extends StatelessWidget {
  final String namaWisata;
  final String imagePath;

  DetailWisata({required this.namaWisata, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    String deskripsi = '';
    String alamat = '';
    String harga = '';
    int rating = 0; // Tambahkan variabel rating

    // Assign deskripsi, alamat, harga, dan rating berdasarkan namaWisata
    if (namaWisata == 'Owabong WaterPark') {
      deskripsi =
      'Tempat wisata Purbalingga yang paling hits pertama adalah Owabong Waterpark. Di sini kamu bisa bermain berbagai wahana air, termasuk terjun dari waterboom yang besar. Di sisi lain, ada wahana istana air, kolam arus, kolam bebas tsunami, waterball, hingga kolam ember tumpah. Kamu juga bisa bermain go-kart dan rafting di Sungai Purbalingga dengan arung jeram yang seru.';
      alamat =
      'Jl. Raya Owabong No.1, Kecamatan Bojongsari, Kabupaten Purbalingga, Jawa Tengah';
      harga = 'Rp25.000 - Rp35.000/orang';
      rating = 4; // Rating untuk Owabong WaterPark
    } else if (namaWisata == 'Gua Lawa') {
      deskripsi =
      'Pernah menjelajah Gua? Di Purbalingga ada sebuah Gua yang indah namanya Gua Lawa. Gua ini punya satu hal yang unik, yakni proses pembentukan Gua Lawa berawal dari letusan gunung api Slamet pada zaman purba yang kemudian membeku dan menjadi sebuah gua. Untuk petualangan yang lebih seru, kamu disarankan untuk mengunjungi Gua Lawa saat pagi hari supaya kamu bisa puas mengeksplor gua ini lebih lanjut.';
      alamat =
      'Desa Siwarak RT. 01/07, Karangreja, Dusun IV, Siwarak, Purbalingga, Kabupaten Purbalingga';
      harga = 'Rp20.000 - Rp25.000/orang';
      rating = 5; // Rating untuk Gua Lawa
    } else if (namaWisata == 'Curug Sumba') {
      deskripsi =
      'Curug Sumba adalah air terjun mini namun memiliki debit air yang cukup tinggi. Toppers, kamu bisa menghabiskan waktu bersantai di sekitaran curug. Warga sekitar memanfaatkan curug ini sebagai tempat mandi dan mencuci, namun mereka belum mengkomersialkan lokasi wisata ini, sehingga kamu bisa masuk secara gratis.';
      alamat =
      'Kemojing, Desa Tlahab, Karangreja, Kemejing, Tlahab Kidul, Kec. Karangreja, Kabupaten Purbalingga';
      harga = 'Gratis';
      rating = 4; // Rating untuk Curug Sumba
    } else if (namaWisata == 'Taman Wisata Purbasari') {
      deskripsi =
      'Ketika kamu menapakkan kaki ke tempat wisata Purbalingga ini, kamu bisa menghabiskan banyak waktu dengan bermain dan belajar dari berbagai koleksi yang ada di sini. Ada planet aquarium, istana burung, diorama satwa, hingga konservasi rusa yang bisa Toppers kunjungi. Di Taman Wisata Pendidikan Purbasari juga ada camping ground dan homestay yang bisa kamu pesan untuk menginap satu malam.';
      alamat =
      'Jl. Raya Purbayasa, RT.03/RW.02, Purbayasa, Kec. Padamara, Kabupaten Purbalingga';
      harga = 'Rp23.000/orang';
      rating = 4; // Rating untuk Taman Wisata Purbasari
    } else if (namaWisata == 'D’las Lembah Asri Serang') {
      deskripsi =
      'Lokasi D’las Lembah Asri Serang berada di Gunung Slamet, karena itu suasana sekitarnya masih sangat asri, sehingga kamu bisa menikmati udara sejuk di sini. Ada berbagai fasilitas hiburan tersedia di D’las Lembah Asri Serang, beberapa diantaranya ada flying fox, ATV, dino land, kereta wisata, memetik buah stroberi, sampai berkuda.';
      alamat =
      'Jl. Raya Serang, Krajan, Serang, Kec. Karangreja, Kabupaten Purbalingga';
      harga = 'Rp5.000/orang';
      rating = 4; // Rating untuk D’las Lembah Asri Serang
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                // Menambahkan border radius dan efek shadow pada gambar
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    namaWisata,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                          (index) => Icon(
                        Icons.star,
                        color: index < rating ? Colors.yellow : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Deskripsi:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Alamat:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    alamat,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Harga:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    harga,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
