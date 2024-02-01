import 'package:do_an_mo_hinh/load/botnav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final oldpassController = TextEditingController();
  final newpassController = TextEditingController();
  final confirmpass = TextEditingController();

  changepass({email, oldpass, newpass, confirm}) async {
    var credentials =
        EmailAuthProvider.credential(email: email, password: oldpass);

    try {
      await currentUser.reauthenticateWithCredential(credentials);
      await currentUser.updatePassword(newpass);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Đổi mật khẩu thành công'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    } catch (error) {
      print(error.toString());

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Lỗi xác thực. Mật khẩu cũ không đúng'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 237, 242),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cài đặt",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
         iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
// ----------------------------------------------- ĐỔI MẬT KHẨU -----------------------------------------------------------------
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Đổi Mật Khẩu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: true, // ẩn mật khẩu
                        controller: oldpassController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Nhập mật khẩu cũ',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: true, // ẩn mật khẩu
                        controller: newpassController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Nhập mật khẩu mới',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        obscureText: true, // ẩn mật khẩu
                        controller: confirmpass,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Nhập lại mật khẩu mới',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 150.0,
                      margin: const EdgeInsets.all(10),
                      height: 50.0,
                      
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(25),
                        
                        
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (newpassController.text.isEmpty ||
                              confirmpass.text.isEmpty ||
                              oldpassController.text.isEmpty) {
                            // Hiển thị hộp thoại khi chưa nhập dữ liệu
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Vui lòng nhập đầy đủ thông tin'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          } else if (newpassController.text ==
                              confirmpass.text) {
                            // Mật khẩu khớp, tiến hành đổi mật khẩu
                            await changepass(
                              email: currentUser.email,
                              oldpass: oldpassController.text,
                              newpass: newpassController.text,
                              confirm: confirmpass.text,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Mật khẩu không khớp'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Xác nhận",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                              
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(idx: 3),
    );
  }
}
