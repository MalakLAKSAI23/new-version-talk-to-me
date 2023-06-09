import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talktome/Views/pages/chat_screen.dart';
import 'package:talktome/Views/pages/languages.dart';
import '../../constants/constants.dart';
import '../auth/Login.dart';


import '../locale/locale_controller.dart';
import '../pages/help.dart';
import '../pages/home_page.dart';
import '../pages/infos.dart';
import '../pages/textToGcode.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MyLocaleController controllerlang = Get.find();

  bool isEnglish = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF021638)
          : Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: myColor, width: 7.5)),
            ),
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/avatar.png'),
                    ),
                  ),
                ),
                Text(FirebaseAuth.instance.currentUser!.email.toString(), style:const TextStyle(fontSize: 20))
              ],
            ),
          ),
          ListTile(
            title: Text("home".tr),
            leading: const Icon(Icons.home),
            onTap: () => Get.off(const HomePage()),
          ),
          ListTile(
            title: Text("infos".tr),
            leading: const Icon(Icons.info),
            onTap: () => Get.off(const Infos()),
          ),
          ListTile(
            title: Text("help".tr),
            leading: const Icon(Icons.help),
            onTap: () => Get.off(const Help()),
          ),
           ListTile(
            title: Text("languages".tr),
            leading: const Icon(Icons.translate),
            onTap: () => Get.off(const Language()),
          ),
            ListTile(
            title:const Text("Chat AI"),
            leading: const Icon(Icons.chat),
            onTap: () => Get.off(const ChatScreen()),
          ),
          Column(
            children: [
              
              ListTile(
                title: Text("logout".tr),
                leading: const Icon(Icons.logout),
                onTap: (){
                  //Firebase signout 
                  FirebaseAuth.instance.signOut();
                  Get.off(const Login());
                  
                  },
              ),

              ListTile(
                title: Text("text To Gcode".tr),
                leading: const Icon(Icons.text_fields_sharp),
                onTap: (){
                  
                  Get.off(const textToGcode());
                  
                  },
              ),
            ],
          ),
          const Divider(),
          ListTile(
            title:Text("chtheme".tr),
            leading: const Icon(Icons.mode_night),
            onTap: (){
              if(Get.isDarkMode){
                Get.changeTheme(ThemeData.light());
              }
              else{
                Get.changeTheme(ThemeData.dark());
              }
            },
          ),

        ],
      ),
    );
  }
}
