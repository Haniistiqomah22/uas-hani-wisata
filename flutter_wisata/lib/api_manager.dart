import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class ApiManager {
  final String baseUrl;
  final storage = FlutterSecureStorage();

  ApiManager({required this.baseUrl});

  Future<void> addTambahWisata(
  String gambarUrl,
  String namaWisata,
  String deskripsi,
  String alamat,
  String harga,
) async {
  
    final response = await http.post(
      Uri.parse('$baseUrl/TambahWisata'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'gambarUrl': gambarUrl,
        'namaWisata': namaWisata,
        'deskripsi': deskripsi,
        'alamat': alamat,
        'harga': harga,
      },
    );

    print(response);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to add TambahWisata');
    }
  
}

  Future<List<Map<String, dynamic>>> getTambahWisata() async {
    final response = await http.get(Uri.parse('$baseUrl/TambahWisata'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } else {
      throw Exception('Failed to get TambahWisata');
    }
  }

  Future<void> updateTambahWisata(String id, String gambarUrl, String namaWisata, String deskripsi, String alamat, String harga) async {
    final response = await http.put(
      Uri.parse('$baseUrl/TambahWisata/{id}'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'id': id,
        'gambarUrl': gambarUrl,
        'namaWisata': namaWisata,
        'deskripsi': deskripsi,
        'alamat': alamat,
        'harga': harga,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update TambahWisata');
    }
  }

  Future<int?> deleteTambahWisata(int id) async {
    final token = await storage.read(key: 'kode_rahasia');
     final response = await http.delete(
      Uri.parse('$baseUrl/TambahWisata'),
      headers: {'Authorization': 'Bearer $token'},
      body: jsonEncode({'id': id}), 
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete TambahWisata ${token}');
    }
    else{
      return response.statusCode;
    }
  }

  Future<String?> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'email': email,
        'password': password
      },
    );

    if (response.statusCode == 201) {
      final token = "Succesfully";
      return token;
    } else {
      throw Exception('Failed to register, email sudah tersedia');

    }
  }


  Future<void> login2(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'email': email,
        'password': password,
      },
    );

    
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];

      await storage.write(key: 'auth_token', value: token);

      return token;
    
    
  }

  Future<String?> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];

      await storage.write(key: 'auth_token', value: token);

      return token;
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    print('Error in login: $e');
    throw e;
  }
}


  Future<String?> authenticate(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];

      // Save the token securely
      await storage.write(key: 'kode_rahasia', value: token);

      return token;
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}