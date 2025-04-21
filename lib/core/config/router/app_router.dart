import 'dart:async';

import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:dnd_app/presentation/auth/login_screen.dart';
import 'package:dnd_app/presentation/auth/main_login_screen.dart';
import 'package:dnd_app/presentation/auth/register_sreen.dart';
import 'package:dnd_app/presentation/dnd/book_screen.dart';
import 'package:dnd_app/presentation/dnd/class_screen.dart';
import 'package:dnd_app/presentation/dnd/class_views/sublcass_screen.dart';
import 'package:dnd_app/presentation/dnd/equipment_screen.dart';
import 'package:dnd_app/presentation/dnd/favorites_screen.dart';
import 'package:dnd_app/presentation/dnd/magic_item_screen.dart';
import 'package:dnd_app/presentation/dnd/race_screen.dart';
import 'package:dnd_app/presentation/dnd/race_views/subrace_screen.dart';
import 'package:dnd_app/presentation/dnd/spell_screen.dart';
import 'package:dnd_app/presentation/home/changelog_screen.dart';
import 'package:dnd_app/presentation/home/home_page.dart';
import 'package:dnd_app/presentation/dnd/monster_screen.dart';
import 'package:dnd_app/presentation/home/profile_screen.dart';
import 'package:dnd_app/presentation/home/tier_screen.dart';
import 'package:dnd_app/presentation/dnd/join_campaign_screen.dart';
import 'package:dnd_app/presentation/referencies/blindsight_screen.dart';
import 'package:dnd_app/presentation/referencies/darkvision_screen.dart';
import 'package:dnd_app/presentation/referencies/history_screen.dart';
import 'package:dnd_app/presentation/referencies/perception_screen.dart';
import 'package:dnd_app/presentation/splash/check_auth_status_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  refreshListenable:
      GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),

  // initialLocation: '/home/0',
  initialLocation: '/authcheck',

  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final location = state.matchedLocation;

    // Si no está logueado y no está en la pantalla de login, redirige al login.
    if (!isLoggedIn &&
        location != '/login' &&
        location != '/register' &&
        location != '/mainlogin') {
      return '/mainlogin';
    }

    // Si está logueado y está en la pantalla de login, redirige al home.
    if (isLoggedIn &&
        (location == '/login' ||
            location == '/register' ||
            location == '/mainlogin')) {
      return '/home/0';
    }
    return null;
  },

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
          path: '/api/2014/monsters/:id',
          builder: (context, state) {
            final monsterId = state.pathParameters['id'] ?? 'no-id';
            return MonsterScreen(monsterId: monsterId);
          },
        ),
        GoRoute(
          path: '/api/2014/magic-items/:id',
          builder: (context, state) {
            final magicItemsId = state.pathParameters['id'] ?? 'no-id';
            return MagicItemScreen(magicItemId: magicItemsId);
          },
        ),
        GoRoute(
          path: '/api/2014/equipment/:id',
          builder: (context, state) {
            final equipmentId = state.pathParameters['id'] ?? 'no-id';
            return EquipmentScreen(equipmentId: equipmentId);
          },
        ),
        GoRoute(
          path: '/api/2014/spells/:id',
          builder: (context, state) {
            final spellId = state.pathParameters['id'] ?? 'no-id';
            return SpellScreen(spellId: spellId);
          },
        ),
        GoRoute(
          path: '/api/2014/races/:id',
          builder: (context, state) {
            final raceId = state.pathParameters['id'] ?? 'no-id';
            return RaceScreen(raceId: raceId);
          },
        ),
        GoRoute(
          path: '/api/2014/classes/:id',
          builder: (context, state) {
            final classId = state.pathParameters['id'] ?? 'no-id';
            return ClassScreen(classId: classId);
          },
        ),
      ],
    ),

    GoRoute(
      path: '/authcheck',
      builder: (context, state) => const AuthCheck(),
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
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/perception',
      builder: (context, state) => const PerceptionScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/blindsight',
      builder: (context, state) => const BlindsightScreen(),
    ),
    GoRoute(
      path: '/darkvision',
      builder: (context, state) => const DarkvisionScreen(),
    ),
    GoRoute(
      path: '/join_campaign_screen',
      builder: (context, state) => const JoinCampaignScreen(),
    ),
    GoRoute(
      path: '/subclass/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return SubclassScreen(subclassUrl: id ?? 'no-id');
      },
    ),
    GoRoute(
      path: '/subrace/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return SubraceScreen(subraceId: id ?? 'no-id');
      },
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

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
