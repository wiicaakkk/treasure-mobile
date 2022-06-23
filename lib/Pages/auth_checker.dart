import 'package:treasure/Pages/error_screen.dart';
import 'package:treasure/Pages/homepage.dart';
import 'package:treasure/Pages/loading_screen.dart';
import 'package:treasure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'home.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return Home_Page();
          return const LoginPage();
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}