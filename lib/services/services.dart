import 'package:flutter/material.dart';
import 'package:talktome/Views/widgets/text_widget.dart';

import '../constants/constants.dart';
class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: myColor1,
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              children: [
                Flexible(
                    child: TextWidget(
                  label: "chosen model",
                  fontSize: 16,
                ))
              ],
            ),
          );
        });
  }
}
