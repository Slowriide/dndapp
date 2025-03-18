import 'package:dnd_app/common/widgets/basic_rules_mark.dart';
import 'package:dnd_app/common/widgets/my_sized_box.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/presentation/providers/magicitem_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MagicItemScreen extends ConsumerStatefulWidget {
  final String magicItemId;
  const MagicItemScreen({super.key, required this.magicItemId});

  @override
  MagicItemScreenState createState() => MagicItemScreenState();
}

class MagicItemScreenState extends ConsumerState<MagicItemScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(magicItemInfoProvider.notifier).loadMagicItem(widget.magicItemId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final MagicItem? magicItem =
        ref.watch(magicItemInfoProvider)[widget.magicItemId];

    if (magicItem == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _Appbar(magicItem: magicItem, textStyles: textStyles),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    magicItem.desc.first,
                    style: textStyles.bodyMedium,
                  ),
                  const MySizedBox(),
                  const Divider(color: Color.fromARGB(187, 89, 145, 248)),
                  const MySizedBox(),
                  Text(magicItem.desc.last, style: textStyles.bodyMedium),
                  const MySizedBox(height: 30),
                  const BasicRulesMark(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({
    required this.magicItem,
    required this.textStyles,
  });

  final MagicItem? magicItem;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 75,
      floating: false,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          SizedBox(
            width: 250,
            child: Text(
              magicItem!.name,
              style: textStyles.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_sharp, size: 30),
          ),
        ],
      ),
    );
  }
}
