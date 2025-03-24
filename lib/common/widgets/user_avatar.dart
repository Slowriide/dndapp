import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAvatar extends StatelessWidget {
  final double height;
  final double width;

  const UserAvatar({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/profile'),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 0.5),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/logoo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
