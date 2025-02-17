import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/presentation/dnd/monster_views/monster_actions_view.dart';
import 'package:dnd_app/presentation/dnd/monster_views/monster_widgets.dart';
import 'package:dnd_app/presentation/providers/monster_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MonsterScreen extends ConsumerStatefulWidget {
  final String monsterId;
  const MonsterScreen({super.key, required this.monsterId});

  @override
  MonsterScreenState createState() => MonsterScreenState();
}

class MonsterScreenState extends ConsumerState<MonsterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    ref.read(monsterInfoProvider.notifier).loadMonster(widget.monsterId);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final Monster? monster = ref.watch(monsterInfoProvider)[widget.monsterId];

    if (monster == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _AppBar(
                monster: monster,
                textStyles: textStyles,
                tabController: _tabController),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            MonsterStats(monster: monster),
            MonsterActionsView(monster: monster),
            LairView(monster: monster),
          ],
        ),
      ),
    );
  }
}

class LairView extends StatelessWidget {
  final Monster? monster;
  const LairView({super.key, this.monster});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text(
          'Lair Content',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.monster,
    required this.textStyles,
    required TabController tabController,
  }) : _tabController = tabController;

  final Monster? monster;
  final TextTheme textStyles;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 100,
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
          //Imagen Nombre Fav
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color.fromARGB(190, 245, 83, 71)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                monster!.image.replaceAll(' ', ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(monster!.name, style: textStyles.bodyMedium),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_sharp, size: 30),
          ),
        ],
      ),

      //Tabs
      bottom: TabBar(
        dividerColor: theme.primary,
        indicatorColor: const Color.fromARGB(190, 245, 83, 71),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: GoogleFonts.roboto(fontSize: 15),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        tabs: const [
          Tab(text: 'STATS'),
          Tab(text: 'ACTIONS'),
          Tab(text: 'LAIR'),
        ],
      ),
    );
  }
}
