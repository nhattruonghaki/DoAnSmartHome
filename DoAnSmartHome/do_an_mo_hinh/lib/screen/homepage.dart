import 'package:do_an_mo_hinh/load/botnav.dart';
import 'package:do_an_mo_hinh/screen/home.dart';
import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/screen/profile.dart';
import 'package:do_an_mo_hinh/screen/setting.dart';
import 'package:do_an_mo_hinh/setting/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE').format(DateTime.now());
    String formattedDateTime =
        DateFormat('dd/MM/yyyy\nHH:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 237, 242),
      appBar: AppBar(
        title: const Text(
          "MY HOT Vinhome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child:Column(
                    children: [
                      Image.asset('assets/img/logo-removebg-preview.png',width: 150,height: 150,),
                    ],
                  ),
                  
                  //  Icon(
                  //   Icons.home_work,
                  //   size: 120,
                  // ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/img/cloudy.jpg'), // Đường dẫn đến ảnh nền

                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formattedDateTime,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Icon(
                        Icons.cloud_queue, // Icon đám mây

                        size: 80, // Kích thước của icon

                        color: Color.fromRGBO(
                            255, 255, 255, 1), // Màu sắc của icon
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '25°C',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Trời nhiều mây',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color.fromARGB(255, 231, 237, 242),
              ),
              child: const Center(
                child: Text(
                  'Chào mừng trở lại!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4 - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color.fromARGB(255, 153, 212, 244),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.home,
                                  size: 60,
                                ),
                                SizedBox(width: 10),
                                SizedBox(width: 45),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  'Nhà của tôi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4 - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color.fromARGB(255, 174, 180, 247),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.account_box,
                                  size: 60,
                                ),
                                SizedBox(width: 10),
                                SizedBox(width: 45),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  'Cá nhân',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Setting()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4 - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color.fromARGB(255, 174, 240, 159),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.settings,
                                  size: 60,
                                ),
                                SizedBox(width: 10),
                                SizedBox(width: 45),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  'Cài đặt',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showLogoutDialog();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4 - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color.fromARGB(255, 245, 195, 104),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                IconButton(
                                    onPressed: () async {
                                      await GoogleSignIn().signOut();
                                      FirebaseAuth.instance.signOut();
                                    },
                                    icon: const Icon(
                                      Icons.logout_rounded,
                                      size: 50,
                                    )),
                                const SizedBox(width: 10),
                                const SizedBox(width: 45),
                              ],
                            ),
                            const SizedBox(height: 22),
                            Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  'Đăng xuất',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận đăng xuất'),
          content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          actions: <Widget>[
            TextButton(
              child: const Text('Không'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/');
                } catch (e) {
                  print('Error signing out: $e');
                }
              },
            ),
          ],
        );
      },
    );
  }
}
