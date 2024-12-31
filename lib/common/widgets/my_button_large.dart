import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyButtonLarge extends StatelessWidget {
  final Color color;
  final String? svg;
  final String text;
  final double height;
  final Function()? onTap;
  const MyButtonLarge({
    super.key,
    required this.color,
    this.svg = '',
    required this.text,
    this.onTap,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svg!.isNotEmpty)
              SvgPicture.asset(
                svg!,
                height: 30,
              ),
            const SizedBox(width: 10),
            Text(
              text,
              style: textStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
