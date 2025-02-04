import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:dnd_app/presentation/auth/login_screen.dart';
import 'package:dnd_app/presentation/auth/main_login_screen.dart';
import 'package:dnd_app/presentation/auth/register_sreen.dart';
import 'package:dnd_app/presentation/dnd/book_screen.dart';
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
