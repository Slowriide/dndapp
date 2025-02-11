import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:dnd_app/presentation/auth/login_screen.dart';
import 'package:dnd_app/presentation/auth/main_login_screen.dart';
import 'package:dnd_app/presentation/auth/register_sreen.dart';
import 'package:dnd_app/presentation/dnd/book_screen.dart';
import 'package:dnd_app/presentation/dnd/class_screen.dart';
import 'package:dnd_app/presentation/dnd/equipment_screen.dart';
import 'package:dnd_app/presentation/dnd/magic_item_screen.dart';
import 'package:dnd_app/presentation/dnd/race_screen.dart';
import 'package:dnd_app/presentation/dnd/spell_screen.dart';
import 'package:dnd_app/presentation/home/changelog_screen.dart';
import 'package:dnd_app/presentation/home/home_page.dart';
import 'package:dnd_app/presentation/dnd/monster_screen.dart';
import 'package:dnd_app/presentation/home/profile_screen.dart';
import 'package:dnd_app/presentation/home/tier_screen.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  // initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        var pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 4 || pageIndex < 0) {
          pageIndex = 0;
        }
        return HomePage(
          pageIndex: pageIndex,
        );
      },
      routes: [
        GoRoute(
          path: '/book',
          builder: (context, state) {
            final book = state.extra as Book;
            return BookScreen(book: book);
          },
        ),
        GoRoute(
          path: '/monster/:id',
          builder: (context, state) {
            final monsterId = state.pathParameters['id'] ?? 'no-id';
            return MonsterScreen(monsterId: monsterId);
          },
        ),
        GoRoute(
          path: '/magic-items/:id',
          builder: (context, state) {
            final magicItemsId = state.pathParameters['id'] ?? 'no-id';
            return MagicItemScreen(magicItemId: magicItemsId);
          },
        ),
        GoRoute(
          path: '/equipment/:id',
          builder: (context, state) {
            final equipmentId = state.pathParameters['id'] ?? 'no-id';
            return EquipmentScreen(equipmentId: equipmentId);
          },
        ),
        GoRoute(
          path: '/spells/:id',
          builder: (context, state) {
            final spellId = state.pathParameters['id'] ?? 'no-id';
            return SpellScreen(spellId: spellId);
          },
        ),
        GoRoute(
          path: '/races/:id',
          builder: (context, state) {
            final raceId = state.pathParameters['id'] ?? 'no-id';
            return RaceScreen(raceId: raceId);
          },
        ),
        GoRoute(
          path: '/classes/:id',
          builder: (context, state) {
            final classId = state.pathParameters['id'] ?? 'no-id';
            return ClassScreen(classId: classId);
          },
        ),
      ],
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/mainlogin',
      builder: (context, state) => const MainLoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/tier',
      builder: (context, state) => const TierScreen(),
    ),
    GoRoute(
      path: '/changelog',
      builder: (context, state) => const ChangelogScreen(),
    ),

    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const HomePage(
    //     childView: HomeView(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/book',
    //   builder: (context, state) {
    //     final book = state.extra as Book;
    //     return BookScreen(book: book);
    //   },
    // ),
    // GoRoute(
    //   path: '/listing',
    //   builder: (context, state) => const ListingScreen(),
    GoRoute(
      path: '/',
      redirect: (_, __) => 'home/0',
    )
  ],
);
