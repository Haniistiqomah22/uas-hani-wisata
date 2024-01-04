import 'package:flutter/material.dart';
import 'package:flutter_wisata/daftar_wisata.dart';
import 'package:flutter_wisata/register.dart'; // Import file register.dart

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.asset(
            'assets/bg.jpg', // Ganti dengan path gambar sesuai kebutuhan
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo dan input untuk username
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Logo dan input untuk password
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaftarWisata()),
                    );
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 10),
                // Tombol Register
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()), // Navigasi ke halaman Register
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
