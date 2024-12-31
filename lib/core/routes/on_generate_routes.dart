import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:journal_app/core/common/views/unknown_screen.dart';
import 'package:journal_app/core/routes/app_routes.dart';
import 'package:journal_app/src/onboarding/presentation/views/on_boarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final dynamic arguments = settings.arguments;
  final uri = Uri.parse(name ?? '');

  switch (name) {
    case AppRoutes.onBoarding:
      return _pageBuilder(
        (_) => const OnBoardingScreen(),
        settings: settings,
      );
    default:
      return _pageBuilder(
          (_) => UnknownScreen(
                  payload: jsonEncode(
                {
                  'route': name,
                  'uri-segments': uri.pathSegments,
                  'arguments': arguments,
                  'uri-query': uri.query,
                },
              )),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
