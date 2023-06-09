import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:talktome/services/services.dart';
import '../../constants/constants.dart';
import '../widgets/chat_widget.dart';
import '../widgets/my_drawer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF021638)
          : Colors.white,
        drawer: const MyDrawer(),
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  color: const Color(0xFFCC1DB9),
                  iconSize: 30,
                )),
         actions: [
            IconButton(
                onPressed: () async {
                  await Services.showModalSheet(context: context);
                },
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: myColor,
                ))
          ],        
      ),
        // appBar: AppBar(
        //   backgroundColor: myColor3,
        //   elevation: 2,
        //   leading: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Image.asset("images/chat.png"),
        //   ),
        //   title: const Text(
        //     "ChatApp",
        //     style: TextStyle(color: Colors.white),
        //   ),
          // actions: [
          //   IconButton(
          //       onPressed: () async {
          //         await Services.showModalSheet(context: context);
          //       },
          //       icon: const Icon(
          //         Icons.more_vert_rounded,
          //         color: Colors.white,
          //       ))
          // ],
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatMessages[index]["msg"].toString(),
                        chatIndex: int.parse(
                            chatMessages[index]["chatIndex"].toString()),
                      );
                    }),
              ),
              if (_isTyping) ...[
                SpinKitThreeBounce(
                  color:  Theme.of(context).brightness == Brightness.dark
                   ? Colors.white
                   : myColor,
                  // color: Colors.white,
                  size: 18,
                ),
                const SizedBox(
                  height: 35,
                ),
                Material(
                  color:Theme.of(context).brightness == Brightness.dark
                   ? myColor3
                   : myColor,
                  // color: myColor3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                              ),
                            controller: textEditingController,
                            onSubmitted: (value) {
                              //TODO SEND MESSAGE
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "How can I help you",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon:const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ]
            ],
          ),
        ));
  }
}
