import 'package:flutter/material.dart';
import 'package:talktome/Views/widgets/text_widget.dart';
import '../../constants/constants.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex}) : super(key: key);
  
  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    Color chatColor;
    
    if (Theme.of(context).brightness == Brightness.dark) {
       if (chatIndex == 0) {
        chatColor = myColor2;
      } else {
        chatColor = myColor3;
      }
      // Dark mode
    } else {
      // Light mode
      if (chatIndex == 0) {
        chatColor = Colors.white;
      } else {
        chatColor = Color(0xfff2f2f2);
      }
    }
    
    return Column(
      children: [
        Material(
          color: chatColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0 ? "images/person.png" : "images/chat.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextWidget(
                    label: msg,
                  ),
                ),
                if (chatIndex != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                         color:Theme.of(context).brightness == Brightness.dark
                         ? Colors.white
                         : myColor,
                        // color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.thumb_down_alt_outlined,
                         color:Theme.of(context).brightness == Brightness.dark
                         ? Colors.white
                         : myColor,
                      )
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}

