import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: textStyles.bodyLarge),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: const _ProfileView(),
      ),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  bool _preventAutoLock = true;
  bool _snowEffect = true;
  bool _highlightRollable = true;
  bool _displaySurveys = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //IMAGE AND USER
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/logoo.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  const MySizedBox(),
                  Text('thiagomgobbi7', style: textStyles.bodyLarge),
                  const MySizedBox(),
                ],
              ),
            ),
            //TIER BOX
            const TierBox(),
            const SizedBox(height: 20),

            //CHANGELOG BOX
            const ChangelogBox(),
            const SizedBox(height: 30),

            //Settings
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('SETTINGS'),
                CustomSwitchTile(
                  title: 'Prevent autolock',
                  value: _preventAutoLock,
                  onChanged: (value) {
                    setState(() {
                      _preventAutoLock = value;
                    });
                  },
                ),
                CustomSwitchTile(
                  title: 'Snow Effect',
                  value: _snowEffect,
                  onChanged: (value) {
                    setState(() {
                      _snowEffect = value;
                    });
                  },
                ),
                CustomSwitchTile(
                  title: 'Highlight Rollable',
                  value: _highlightRollable,
                  onChanged: (value) {
                    setState(() {
                      _highlightRollable = value;
                    });
                  },
                ),
                CustomSwitchTile(
                  title: 'Display Surveys',
                  value: _displaySurveys,
                  onChanged: (value) {
                    setState(() {
                      _displaySurveys = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),
            //Support
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('SUPPORT'),
                SupportButton(
                  text: 'Support',
                  onTap: () {},
                ),
                SupportButton(
                  text: 'Support information',
                  onTap: () {},
                ),
                SupportButton(
                  text: 'Dont sale or share my info',
                  onTap: () {},
                ),
                SupportButton(
                  text: 'Privacy Policy',
                  onTap: () {},
                ),
                SupportButton(
                  text: 'Terms of Use',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 25),
            MyButtonLarge(
              color: theme.primary,
              text: 'Sign Out',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
