import 'dart:ui';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TierBox extends StatelessWidget {
  const TierBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push('/tier'),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black.withValues(),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 200,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/l2ju0ni2ndma1.jpg',
                      width: 700,
                      height: 700,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Capa con azul oscuro semitransparente
            Positioned.fill(
              child: Container(
                  color: const Color.fromARGB(255, 5, 27, 59).withValues(
                alpha: 100,
              ) // Azul oscuro semi-transparente
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const UserAvatar(
                      height: 40,
                      width: 40,
                    ),
                    Text('Free Tier', style: textStyles.bodyLarge),
                    const Spacer(),
                    Text(
                      'Manage',
                      style: TextStyle(
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
