import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'package:app/features/auth/splash_page.dart';
import 'package:app/features/dashboard/dashboard_shell.dart';
import 'package:app/pages/public_page.dart';

// import 'package:app/features/auth/card_flip.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool showSplash = true;
  bool showPublicPage = true;

  // bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),

      home: showSplash
          ? const SplashPage()
          : showPublicPage
          ? PublicPage(
              onOpenDemo: () {
                setState(() {
                  showPublicPage = false;
                });
              },
            )
          : const DashboardShell(),

      ///home: showSplash

      //? const SplashPage()

      //: showPublicPage

      //? const Scaffold(

      //backgroundColor: Colors.red,

      //body: Center(

      //  child: Text(

      //  "PUBLIC PAGE TEST",

      //  style: TextStyle(color: Colors.white, fontSize: 40),

      // ),

      // ),

      //)

      //: isLoggedIn

      //? DashboardShell(

      //onLogout: () {

      //setState(() {

      //isLoggedIn = false;

      //showPublicPage = true;

      //});

      //},

      //)

      //: CardFlip(

      //onLogin: () {

      //setState(() {

      //isLoggedIn = true;

      //});

      //},

      //),
    );
  }
}
