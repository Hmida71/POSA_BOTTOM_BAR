import 'dart:io';

import 'package:first_packeges/main.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class PageTest extends StatefulWidget {
  const PageTest({Key? key}) : super(key: key);

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 30, bottom: 20),
                child: Text(
                  "Page ${currentIndex + 1} test yoo !",
                  style: const TextStyle(fontSize: 20),
                )),
            InkWell(
              splashColor: Colors.purple[200],
              onTap: () async {
                Uri urldiscord = Uri.parse("https://github.com/Hmida71");

                if (Platform.isAndroid) {
                  await launchUrl(urldiscord,
                      mode: LaunchMode.externalApplication);
                }
              },
              child: ListTile(
                selectedTileColor: Colors.purple[200],
                selectedColor: Colors.purple[200],
                isThreeLine: false,
                leading: const CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Ionicons.logo_github,
                      size: 28,
                    )),
                title: const Text("Check Github : Hmida71"),
                subtitle: const Text("Web : https://hmida71.netlify.app"),
              ),
            )
          ],
        )),
      ),
    );
  }
}
