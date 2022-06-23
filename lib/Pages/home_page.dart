// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:convert';
import 'package:treasure/Pages/home.dart';
import 'package:treasure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:treasure/models/post.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fireBaseAuthProvider);

    final _auth = ref.watch(authenticationProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 15, 23),
        title: Text('Profile'),
          centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.currentUser!.email ?? 'You are logged In'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 48.0),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () => _auth.signOut(),
                // ignore: sort_child_properties_last
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                // ignore: prefer_const_constructors
                textColor: Color.fromARGB(255, 0, 0, 0),
                textTheme: ButtonTextTheme.primary,
                minWidth: 100,
                padding: const EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // ignore: prefer_const_constructors
                  side: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
