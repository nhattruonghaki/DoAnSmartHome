import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgot_pass extends StatefulWidget {
   forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {
     final txt_us = TextEditingController();
  @override
  void dispose (){
    txt_us.dispose();
    super.dispose();
  }
  Future pass_reset()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: txt_us.text.trim());
      showDialog(context: context, builder: (context){
          return AlertDialog(
          title: Text('Nhận thông báo thay đổi password ở Gmail!'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('OK'))
          ],
        );
      });
    }on FirebaseAuthException catch(e){
      showDialog(context: context, builder: (context){
          return AlertDialog(
          title: Text('Không tìm thấy email!'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('OK'))
          ],
        );
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 30,),
              Icon(
                Icons.lock_open,size: 100,
              ),
              SizedBox(height: 75,),
          ////Text khới đầu//////////
          Text("Tìm lại tài khoản!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36),),

          SizedBox(height: 10,),

          Text("Nhập đúng Gmail đã dùng để đăng ký",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20),textAlign: TextAlign.center,),

            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nhập email',
                    ),
                    controller: txt_us,
                  ),
                ),                
              ),             
            ),

            SizedBox(height: 10,),
            MaterialButton(onPressed: pass_reset,
            child: Text('Reset password!',style: TextStyle(color: Colors.white),),color: Colors.blue,)
        ]),
      ))
    );
  }
}