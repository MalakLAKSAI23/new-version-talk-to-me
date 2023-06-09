// ignore: file_names
import 'package:flutter/material.dart';



import '../../constants/constants.dart';
import '../widgets/my_drawer.dart';
// ignore: camel_case_types
class textToGcode extends StatefulWidget {
  const textToGcode({super.key});

  @override
  State<textToGcode> createState() => _textToGcodeState();
}

// ignore: camel_case_types
class _textToGcodeState extends State<textToGcode> {
  var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF021638)
            : Colors.white,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Center(child: Text("Talk To Me")),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
              color: myColor,
              iconSize: 30,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        
              Row(
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: "Entre your text here ",
                      label: Text("Text Here "),
                      border: OutlineInputBorder()
                    ),
                  )
                ],
              )
            ]),
        )
           );
  }
}