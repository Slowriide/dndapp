import 'package:dnd_app/common/widgets/my_sized_box.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JoinCampaignScreen extends StatelessWidget {
  const JoinCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        //APPBAR TEXT
        title: Text('Join Campaign', style: textStyles.bodyLarge),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/winter_dragon.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      theme.surface,
                    ],
                    stops: const [0.3, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.67,
                  ),
                  Text(
                    'Please enter the join campaign link shared by the Dungeon Master.',
                    style: textStyles.bodySmall!.copyWith(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const MySizedBox(),
                  const CustomSearchbox(
                    hint: 'https://www.dndbeyond.com/campaigns/join/',
                    borderside: true,
                    padding: false,
                  ),
                  const MySizedBox(),
                  const MyButtonLarge(
                    color: Colors.blue,
                    text: 'CONTINUE',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
