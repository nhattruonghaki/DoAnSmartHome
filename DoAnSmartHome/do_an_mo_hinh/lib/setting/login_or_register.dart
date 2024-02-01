import 'package:do_an_mo_hinh/screen/login.dart';
import 'package:do_an_mo_hinh/screen/register.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Logon_or_register extends StatefulWidget {
  const Logon_or_register({super.key});

  @override
  State<Logon_or_register> createState() => _Logon_or_registerState();
}

class _Logon_or_registerState extends State<Logon_or_register> {
  bool showLogin = true;

  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(
        onTap: togglePage,
      );
    } else {
      return register(
        onTap: togglePage,
      );
    }
  }
}
