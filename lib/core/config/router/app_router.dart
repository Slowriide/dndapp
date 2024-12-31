import 'package:dnd_app/data/models/dnd/books/book.dart';
import 'package:dnd_app/presentation/auth/login_screen.dart';
import 'package:dnd_app/presentation/auth/main_login_screen.dart';
import 'package:dnd_app/presentation/auth/register_sreen.dart';

import 'package:dnd_app/presentation/dnd/book_screen.dart';
import 'package:dnd_app/presentation/home/home_page.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
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
