import 'package:do_an_mo_hinh/screen/home.dart';
import 'package:do_an_mo_hinh/screen/homepage.dart';
import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/setting/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class auth extends StatelessWidget {
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data == null) {
                return const Logon_or_register();
              } else {
                return const HomeScreen();
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
