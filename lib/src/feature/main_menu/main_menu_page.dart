import 'package:flutter/material.dart';
import 'dart:math';
import 'package:job_job_game/src/config/theme.dart';
import 'package:job_job_game/src/core/classes/app.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({Key? key}) : super(key: key);

  getRandomString(int length) {
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  String roomId = getRandomString(4);
                  App.database.collection('game').doc(roomId).set({
                    "user": roomId,
                  });
                  final snapshot =
                      await App.database.collection('game').doc(roomId).get();
                  print(snapshot.data());
                },
                child: Text(
                  "Создать",
                  style: AppTextTheme.button,
                )),
          ),
          TextField(
            controller: textEditingController,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final snapshot = await App.database
                      .collection('game')
                      .doc(textEditingController.text)
                      .get();
                  print(snapshot.data());
                },
                child: Text(
                  "Присоединиться",
                  style: AppTextTheme.button,
                )),
          )
        ],
      ),
    );
  }
}
