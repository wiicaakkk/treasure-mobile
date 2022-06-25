import 'package:treasure/Pages/firebase/error_screen.dart';
import 'package:treasure/Pages/navbar.dart';
import 'package:treasure/Pages/loading_screen.dart';
import 'package:treasure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../profile.dart';
import 'login_page.dart';
import '../page/home.dart';

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