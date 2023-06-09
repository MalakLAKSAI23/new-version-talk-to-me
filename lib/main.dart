import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talktome/Views/locale/locale_controller.dart';
import 'package:talktome/Views/locale/translation.dart';
import 'package:get/get.dart';
import 'package:talktome/Views/pages/home_page.dart';
import 'package:talktome/Views/pages/splash.view.dart';
import 'package:talktome/Views/theme/theme.dart';

// import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      theme: Themes.customLightTheme,
      darkTheme: Themes.customDarkTheme,
      home: const SplashView(),
      // home: const HomePage(),
      translations: Translation(),
      locale: controller.initialLang,
      fallbackLocale: const Locale("en"),
      debugShowCheckedModeBanner: false,
    );
  }
}
