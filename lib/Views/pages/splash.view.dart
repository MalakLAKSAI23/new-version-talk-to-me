import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talktome/Views/pages/home_page.dart';

import '../auth/Login.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () async {
       //Cheking if user sign out 
        // ignore: await_only_futures
        await FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          if (kDebugMode) {
            print('User is currently signed out!');
          }
           Get.off(()=> const Login());
        } else {
          if (kDebugMode) {
            print('User is signed in!');
          }
           Get.off(()=> const HomePage());

        }
      });
    });
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF021638)
            : Colors.white,
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.all(40),
            child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? "images/logodark.png"
                    : "images/logolight.png",
                height: 200,
                width: 300),
          ),
        ));
  }
}
