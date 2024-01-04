import 'package:flutter/material.dart';
import 'package:flutter_wisata/daftar_wisata.dart';
import 'splash_screen.dart';
import 'api_manager.dart';
import 'loginpage.dart';
import 'register.dart';
import 'user_manager.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  final ApiManager apiManager = ApiManager(baseUrl: 'http://192.168.0.104:8000');
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager()),
        Provider.value(value: apiManager),
      ],
      
      child: MaterialApp(
        title: 'Wisata Purbalingga',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/loginpage': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/daftarWisata': (context) => DaftarWisata(),

       
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}