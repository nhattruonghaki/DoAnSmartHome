// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Home extends StatelessWidget {
//    Home({super.key});
//   void signin(){
//     FirebaseAuth.instance.signOut();
//     }

//   final user = FirebaseAuth.instance.currentUser!;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('IOT App'),
//         actions: [

//           IconButton(onPressed: () async{
//             await GoogleSignIn().signOut();
//             FirebaseAuth.instance.signOut();
//           }, icon: Icon(Icons.logout_rounded))
//         ],
//       ),
//       body:  Center(child: Text("Login:"+user.email!),),
//     );
//   }
// }

import 'package:do_an_mo_hinh/load/botnav.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

final DatabaseReference ledRef =
        FirebaseDatabase.instance.ref().child('LED');
void initState() {
  super.initState();

  // Thiết lập lắng nghe sự kiện cho sự thay đổi trong nút LED
  ledRef.onValue.listen((event) {
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic>? values = event.snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {
        for (int i = 0; i < tenPhong.length; i++) {
          trangThaiPhong[i] = values[tenPhong[i]] == 1;
        }

        setState(() {});
      }
    }
  });
}



    void updateFirebaseState(String phong, int newState) {
    final DatabaseReference ledPhongRef =
        FirebaseDatabase.instance.ref().child('LED').child(phong);

    ledPhongRef.set(newState);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 237, 242),
        appBar: AppBar(
          title: const Text(
            "MY HOT Vinhome",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(40), // Kích thước tối ưu cho TabBar

            child: Container(
              color: const Color.fromARGB(6, 47, 45, 45),
              child:  TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 1),
                        Text('Tất Cả'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.living),
                        SizedBox(width: 1),
                        Text('Sảnh'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bed),
                        SizedBox(width: 1),
                        Text('Phòng'),
                      ],
                    ),
                  ),
                ],
                labelColor: Colors.blue,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.black, // unfocus
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0), // Khoảng cách với 2 bên viền
              child: GridView.builder(
                padding:
                    const EdgeInsets.only(top: 10.0), // Khoảng cách với AppBar
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                  mainAxisSpacing: 10.0, // Khoảng cách giữa các dòng
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  int selectedRoomIndex = indexAll[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Bo góc
                      color: Color.fromARGB(255, 153, 212, 244), // Màu nền của phòng là màu xanh
                     // Viền bo góc
                    ),
                    constraints: const BoxConstraints.tightFor(
                        height: 50.0, width: 50.0), // Kích thước của khung
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.lightbulb
                                  : Icons.lightbulb_outline,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: 50,
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(width: 45),
                            Positioned(
                              child: IconButton(
                                icon: const Icon(Icons.power_settings_new),
                                color: Colors.red,
                                iconSize: 50,
                                padding: const EdgeInsets.all(
                                    0), // Xóa khoảng cách xung quanh icon
                                onPressed: () {
                                  setState(() {
                                    trangThaiPhong[selectedRoomIndex] =
                                        !trangThaiPhong[selectedRoomIndex];
                                    int newValue =
                                    trangThaiPhong[selectedRoomIndex] ? 1 : 0;
                                
                                // Cập nhật trạng thái của phòng trên Firebase
                                updateFirebaseState(
                                    tenPhong[selectedRoomIndex], newValue);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              tenPhong[selectedRoomIndex],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.circle
                                  : Icons.circle,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.green
                                  : Colors.red,
                              size: 25,
                            ),
                            const SizedBox(
                                width:
                                    15), // Khoảng cách giữa icon và thông tin trạng thái
                            Text(
                              trangThaiPhong[selectedRoomIndex] ? 'Bật' : 'Tắt',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        // Thêm các thông tin khác về phòng tại index này
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), // Khoảng cách với 2 bên viền
              child: GridView.builder(
                padding:
                    const EdgeInsets.only(top: 10.0), // Khoảng cách với AppBar
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                  mainAxisSpacing: 10.0, // Khoảng cách giữa các dòng
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  int selectedRoomIndex = indexSanh[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Bo góc
                      color:Color.fromARGB(255, 148, 210, 237), // Màu nền của phòng là màu xanh
                      
                    ),
                    constraints: const BoxConstraints.tightFor(
                        height: 50.0, width: 50.0), // Kích thước của khung
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.lightbulb
                                  : Icons.lightbulb_outline,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: 50,
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(width: 45),
                            Positioned(
                              child: IconButton(
                                icon: const Icon(Icons.power_settings_new),
                                color: Colors.red,
                                iconSize: 50,
                                padding: const EdgeInsets.all(
                                    0), // Xóa khoảng cách xung quanh icon
                                onPressed: () {
                                  setState(() {
                                    trangThaiPhong[selectedRoomIndex] =
                                        !trangThaiPhong[selectedRoomIndex];
                                    int newValue =
                                    trangThaiPhong[selectedRoomIndex] ? 1 : 0;
                                
                                // Cập nhật trạng thái của phòng trên Firebase
                                updateFirebaseState(
                                    tenPhong[selectedRoomIndex], newValue);                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              tenPhong[selectedRoomIndex],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.circle
                                  : Icons.circle,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.green
                                  : Colors.red,
                              size: 25,
                            ),
                            const SizedBox(
                                width:
                                    15), // Khoảng cách giữa icon và thông tin trạng thái
                            Text(
                              trangThaiPhong[selectedRoomIndex] ? 'Bật' : 'Tắt',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        // Thêm các thông tin khác về phòng tại index này
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), // Khoảng cách với 2 bên viền
              child: GridView.builder(
                padding:
                    const EdgeInsets.only(top: 10.0), // Khoảng cách với AppBar
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                  mainAxisSpacing: 10.0, // Khoảng cách giữa các dòng
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  int selectedRoomIndex = indexPhong[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Bo góc
                      color: Color.fromARGB(255, 148, 210, 237), // Màu nền của phòng là màu xanh
                       // Viền bo góc
                    ),
                    constraints: const BoxConstraints.tightFor(
                        height: 50.0, width: 50.0), // Kích thước của khung
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.lightbulb
                                  : Icons.lightbulb_outline,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: 50,
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(width: 45),
                            Positioned(
                              child: IconButton(
                                icon: const Icon(Icons.power_settings_new),
                                color: Colors.red,
                                iconSize: 50,
                                padding: const EdgeInsets.all(
                                    0), 
                                onPressed: () {
                                  setState(() {
                                    trangThaiPhong[selectedRoomIndex] =
                                        !trangThaiPhong[selectedRoomIndex];
                                        int newValue =
                                    trangThaiPhong[selectedRoomIndex] ? 1 : 0;
                                
                                // Cập nhật trạng thái của phòng trên Firebase
                                updateFirebaseState(
                                    tenPhong[selectedRoomIndex], newValue);                                
                                      });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              tenPhong[selectedRoomIndex],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              trangThaiPhong[selectedRoomIndex]
                                  ? Icons.circle
                                  : Icons.circle,
                              color: trangThaiPhong[selectedRoomIndex]
                                  ? Colors.green
                                  : Colors.red,
                              size: 25,
                            ),
                            const SizedBox(
                                width:
                                    15), // Khoảng cách giữa icon và thông tin trạng thái
                            Text(
                              trangThaiPhong[selectedRoomIndex] ? 'Bật' : 'Tắt',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      
                      ],
                    ),
                  );
                },
              ),
            ),
           
            
          ],
        ),
        bottomNavigationBar: const BottomNav(idx: 1),
      ),
    );
  }
}

List<bool> trangThaiPhong = [false, false, false, false, false, false, false, false];
List<String> tenPhong = [
  'Sảnh',
  'Phòng ngủ 1',
  'Phòng ngủ 2',
  'Phòng ngủ 3',
  'Phòng bếp',
  'Toilet',

];

List<int> indexAll = [0, 1, 2, 3, 4, 5];
List<int> indexSanh = [0, 4, 5];
List<int> indexPhong = [1, 2, 3];

