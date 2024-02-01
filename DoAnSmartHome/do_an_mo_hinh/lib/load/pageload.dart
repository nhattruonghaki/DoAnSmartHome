import 'package:do_an_mo_hinh/screen/setting.dart';
import 'package:do_an_mo_hinh/screen/home.dart';
import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/setting/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageLoad extends StatelessWidget {
  const PageLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Setting();
          } else{
            return auth();
          }
        },
      ),
    );
  }
}