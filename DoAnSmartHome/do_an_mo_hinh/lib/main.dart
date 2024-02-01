import 'package:do_an_mo_hinh/firebase_options.dart';
import 'package:do_an_mo_hinh/screen/homepage.dart';
import 'package:do_an_mo_hinh/screen/profile.dart';
import 'package:do_an_mo_hinh/screen/setting.dart';
import 'package:do_an_mo_hinh/screen/home.dart';
import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/screen/register.dart';
import 'package:do_an_mo_hinh/setting/auth.dart';
import 'package:do_an_mo_hinh/setting/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => auth(),
        '/homepage': (context) => HomeScreen(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/setting': (context) => Setting(),
      }
    );
  }
}


