import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:moneymanager/const.dart';
import 'package:moneymanager/interface/widget/button.dart';
import 'package:moneymanager/interface/layar/pilihan.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          FlutterI18n.translate(context, kSettingsTitle),
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleButton(
                    color: Colors.deepOrange,
                    iconPath: 'images/reset.png',
                    title: FlutterI18n.translate(context, kResetButton),
                    onPressed: () {
                      Navigator.pushNamed(context, kSettingsChoiceScreenID,
                          arguments: Settings.reset);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
