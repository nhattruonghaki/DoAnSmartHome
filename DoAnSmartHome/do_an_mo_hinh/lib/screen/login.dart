import 'package:do_an_mo_hinh/screen/forgot_password.dart';
import 'package:do_an_mo_hinh/screen/register.dart';
import 'package:do_an_mo_hinh/service/service_gg.dart';
import 'package:do_an_mo_hinh/setting/SquareTile.dart';
import 'package:do_an_mo_hinh/setting/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function ()? onTap;
  Login({super.key, required this.onTap});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final txt_us = TextEditingController();
  final txt_pass = TextEditingController();
  
  
  void signUserIn()async{
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: txt_us.text, 
      password: txt_pass.text
      );

    //Navigator.pop(context);
    }on FirebaseAuthException catch(e){

      showDialog(context: context, builder: (BuildContext){
        if(txt_us.text.isEmpty || txt_pass.text.isEmpty){
          return AlertDialog(
          title: Text('Vui lòng nhập đầy đủ thông tin'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('OK'))
          ],
        );
        }else{
          return AlertDialog(
          title: Text('Lỗi đăng nhập tài khoản chưa tồn tại'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('OK'))
          ],
        );
        }
        
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
       
        child: Center( 
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/img/logo-removebg-preview.png',width: 180,height: 180,),
              // Icon(
              //   Icons.home_work,size: 150,
              // ),
              SizedBox(height: 30),
          ////Text khới đầu//////////
          Text("Hello Again!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36),),

          SizedBox(height: 10,),

          Text("Chào mừng bạn quay trở về nhà!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20),),

            SizedBox(height: 50,),
            ////////TextField nhập email đăng nhập///////////
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
                      hintText: 'Nhập emal hoặt số điện thoại',
                    ),
                    controller: txt_us,
                  ),
                ),                
              ),             
            ),
             /////////TextField nhập Password///////////
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left:20.0),
                  child: TextField(
                    obscureText: true,///ẩn mật khẩu
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nhập mật khẩu',
                    ),
                    controller: txt_pass,
                  ),
                ),
              ),
            ),
            /////Nút đăng nhập/////////
            
            SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return forgot_pass();
                  }));
                },
                child:
                Text('Quên mật khẩu?',style: TextStyle(color: Colors.grey[600]),),
                )
              ],
            ),),


            SizedBox(height: 10,),

            MyButton(
              text: "Đăng nhập",
              onTap: signUserIn,),
            /////Chưa có tài khoản//////
          
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chưa có tài khoản? ',style: TextStyle(fontWeight: FontWeight.bold),),
                GestureDetector(
                onTap: widget.onTap,
                child:
                Text('Đăng ký ngay ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            )],
            ),
            SizedBox(height: 30,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              squareTile(
                onTap: ()=>GG_service().singInGG(),
                imagePath: 'assets/img/google.png', ),
              // Image.asset(
              //   'assets/img/Facebook.png',height: 50,
              // ),
              SizedBox(width: 10,),

              // Image.asset(
              //   'assets/img/google.png',height: 50,
              // ),
            ],
           )
        ],),
      )
      )
    );
  }
}
