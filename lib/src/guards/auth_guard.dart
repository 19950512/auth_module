import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getBool('isLogged')!;
  }
}
