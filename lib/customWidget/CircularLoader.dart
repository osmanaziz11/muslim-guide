// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  double? _h = 20;
  double? _w = 20;
  double? _sw = 20;
  int _c = 0xFFBEC2C2;
  CircularLoader({super.key});
  CircularLoader.custom({super.key, height, width, strokeWidth, color}) {
    _h = height;
    _w = width;
    _sw = strokeWidth;
    _c = color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _h,
      width: _w,
      child: CircularProgressIndicator(
        color: Color(_c),
        strokeWidth: 2,
      ),
    );
  }
}
