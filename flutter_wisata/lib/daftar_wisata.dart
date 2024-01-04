import 'package:flutter/material.dart';
import 'detail_wisata.dart';
import 'tambah_wisata_form.dart';

class DaftarWisata extends StatefulWidget {
  @override
  _DaftarWisataState createState() => _DaftarWisataState();
}

class _DaftarWisataState extends State<DaftarWisata> {
  List<String> daftarWisata = [
    'Owabong WaterPark',
    'Gua Lawa',
    'Curug Sumba',
    'Taman Wisata Purbasari',
    'D’las Lembah Asri Serang',
  ];
  

  List<String> imagePaths = [
    'owabongp.jpg',
    'gualawa.jpg',
    'curug.jpg',
    'purbasari.jpg',
    'serang.jpg',
  ];

  List<String> filteredWisata = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredWisata.addAll(daftarWisata);
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(daftarWisata);
    if (query.isNotEmpty) {
      List<String> searchListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchListData.add(item);
        }
      });
      setState(() {
        filteredWisata.clear();
        filteredWisata.addAll(searchListData);
      });
      return;
    } else {
      setState(() {
        filteredWisata.clear();
        filteredWisata.addAll(daftarWisata);
      });
    }
  }

  void _showAddWisataForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TambahWisataForm(onTambahWisata: _tambahDataWisata);
      },
    );
  }

  void _tambahDataWisata(String namaWisata, String imagePath) {
    setState(() {
      daftarWisata.add(namaWisata);
      imagePaths.add(imagePath);
      filteredWisata.add(namaWisata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('logo.png', height: 100, width: 100),
                  SizedBox(width: 8),
                  Text(
                    'Wisata Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo Hani!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hari yang cerah, mau pergi kemana hari ini?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: InputDecoration(
                  labelText: 'Cari destinasi wisata . . .',
                  hintText: 'Masukkan nama wisata',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filteredWisata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailWisata(
                          namaWisata: filteredWisata[index],
                          imagePath: imagePaths[index],
                        ),
                      ),
                    );
                  },
                  child: buildWisataCard(filteredWisata[index], imagePaths[index]),
                );
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                   _showAddWisataForm(context);
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWisataCard(String namaWisata, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5.0,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                namaWisata,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
