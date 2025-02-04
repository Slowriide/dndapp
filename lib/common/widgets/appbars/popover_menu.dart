import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopoverMenu extends StatelessWidget {
  final Function()? onDownloadAllTap;
  final Function()? onUpdateAllTap;
  const PopoverMenu({super.key, this.onDownloadAllTap, this.onUpdateAllTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: const Center(
              child: Text('Download All'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: const Center(
              child: Text('Update All'),
            ),
          ),
        ),
      ],
    );
  }
}
