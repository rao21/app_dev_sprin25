import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      name: 'homeDetail',
      path: '/homeDetail',
      builder: (context, state) => HomeDetail(),
    ),
  ],
);