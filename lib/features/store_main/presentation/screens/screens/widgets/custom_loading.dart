import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  CustomLoading([this.color, this.height, this.width]);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SizedBox(
            height: height ?? 50.0,
            width: width ?? 50.0,
            child: Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(
                      backgroundColor: color ?? null,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFF037979))),
            )),
      ),
    );
  }
}
