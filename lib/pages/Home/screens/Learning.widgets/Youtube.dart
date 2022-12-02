import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 10),
          color: Color.fromARGB(255, 255, 255, 255),
        ));
  }
}
