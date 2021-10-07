import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({Key? key, required this.h}) : super(key: key);
  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * h,
    );
  }
}

class WidthWidget extends StatelessWidget {
  const WidthWidget({Key? key, required this.w}) : super(key: key);
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * w,
    );
  }
}
