// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:treasure/Pages/favorite.dart';
// import 'package:treasure/Pages/home.dart';
// import 'package:treasure/Pages/homepage.dart';
// import 'package:treasure/Pages/maps.dart';
// import 'package:treasure/Pages/search.dart';
import 'Pages/error_screen.dart';
import 'Pages/loading_screen.dart';
import 'Pages/auth_checker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}


final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final initialize = ref.watch(firebaseinitializerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: 
      initialize.when(
          data: (data) {
            return const AuthChecker();
          },
          loading: () => const LoadingScreen(),
          error: (e, stackTrace) => ErrorScreen(e, stackTrace)),
    );
  }
}
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {

//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Persistent Bottom Nav Bar"),
//         elevation: 0,

//       ),
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: const [
//           Home(),
//           Search(),
//           Favorite(),
//           Maps(),
//         ],
//         items: _navBarsItems(),
//         navBarStyle: NavBarStyle.style1,
//       ),
//     );
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.home),
//         title: ("Home"),
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.search),
//         title: ("Search"),
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.chat_bubble),
//         title: ("Chat"),
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.bell),
//         title: ("Notification"),
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//     ];
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home_Page(),
//     );
//   }
// }
