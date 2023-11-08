import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: const Center(
          child: Icon(
            Icons.camera_alt_outlined,
            size: 50  ,
          ),
        ));
  }
}
