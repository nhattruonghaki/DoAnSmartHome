import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/setting/auth.dart';
import 'package:do_an_mo_hinh/setting/button.dart';
import 'package:do_an_mo_hinh/setting/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class register extends StatefulWidget {
  final Function()? onTap;
  register({super.key,required this.onTap});
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
      final txt_email = TextEditingController();
      final txt_us = TextEditingController();
      final txt_pass = TextEditingController();
      final txt_pass2 = TextEditingController();
      final txt_sdt = TextEditingController();

      void signUserUn()async{
        try{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txt_email.text, 
          password: txt_pass.text
          );
        //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Logon_or_register()),);
        Navigator.pop(context);
        
        }on FirebaseAuthException catch(e){
          showDialog(context: context, builder: (BuildContext){
            if(txt_us.text.isEmpty || txt_pass.text.isEmpty||txt_pass2.text.isEmpty||txt_sdt.text.isEmpty||txt_email.text.isEmpty){
              return AlertDialog(
              title: Text('Vui lòng nhập đầy đủ thông tin'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('OK'))
              ],
            );
            }else if(txt_sdt.text.length<10||txt_sdt.text.length>10){
              return AlertDialog(
              title: Text('Số điện thoại không hợp lệ'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('OK'))
              ],
            );
            }else if(txt_pass.text != txt_pass2.text){
              return AlertDialog(
              title: Text('Số điện thoại không hợp lệ '),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('OK'))
              ],
            );
            }else{
              return AlertDialog(
                title: Text('Lỗi đăng nhập tài khoản đã tồn tại hoặt email không hợp lệ'),
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
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
       
        child: Center( 
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Icon(
                Icons.key,size: 100,
              ),
              SizedBox(height: 30,),
          ////Text khới đầu//////////
          Text("WELCOME!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36),),

          SizedBox(height: 10,),

          Text("Chào mừng bạn đã đặt chân đến ngôi nhà mới của mình!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20),textAlign: TextAlign.center,),

            SizedBox(height: 30,),
            ////////Tên người dùng////////////
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
                      hintText: 'Nhập tên người dùng',
                    ),
                    controller: txt_us,
                  ),
                ),                
              ),             
            ),
            ///////Nhập số điện thoại///////////
             SizedBox(height: 10,),
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
                      hintText: 'Nhập email',
                    ),
                    controller: txt_email,
                  ),
                ),                
              ),             
            ),
            ///////Nhập số điện thoại///////////
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nhập số điện thoại',
                    ),
                    controller: txt_sdt,
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
            //////////Nhập lại mật khẩu//////////
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
                      hintText: 'Nhập lại mật khẩu',
                    ),
                    controller: txt_pass2,
                  ),
                ),
              ),
            ),
            /////Nút đăng nhập/////////
            SizedBox(height: 10,),

            MyButton(
              text: "Đăng ký",
              onTap: signUserUn,),
    
            /////Chưa có tài khoản//////
          
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                onTap: widget.onTap,
                child:
                Text('Quay lại đăng nhập',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            )],
            ),
           
        ],),
      )
      )
    );
  }
  ////chuyển trang khi bấm đăng ký/////
  void login(BuildContext context){
      Navigator.push(  
      context, 
      MaterialPageRoute(builder: (context)=>auth()));
  }
}