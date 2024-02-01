
import 'package:do_an_mo_hinh/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GG_service{
  singInGG()async{
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    final credentail = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken:gAuth?.idToken,
    );
      
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credentail);

      print(userCredential.user?.displayName);

  }
}