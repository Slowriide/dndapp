import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String image;
  const Background({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
              child: Container(
            color: Colors.black87,
          )),

          ///* Background image
          Center(
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: size.height * 0.7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.3),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 1],
                colors: [
                  Colors.transparent,
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),

          child
        ],
      ),
    );
  }
}
