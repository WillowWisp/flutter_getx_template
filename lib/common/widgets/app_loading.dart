import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoading extends StatelessWidget {
  final Color color;
  final double size;
  final double lineWidth;

  const AppLoading({
    Key? key,
    this.color = Colors.blue,
    this.size = 50,
    this.lineWidth = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: size,
      lineWidth: lineWidth,
    );
  }
}
