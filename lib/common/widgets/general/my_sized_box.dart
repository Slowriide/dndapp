import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  final double? height;
  // ignore: unused_element
  const MySizedBox({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 17);
  }
}
