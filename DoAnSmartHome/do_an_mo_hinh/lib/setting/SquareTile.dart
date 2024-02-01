import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class squareTile extends StatelessWidget {
  const squareTile({super.key, required this.imagePath, required this.onTap});
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[200]
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}