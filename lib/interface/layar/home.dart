import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:moneymanager/interface/layar/tambah_trans.dart';
import 'package:moneymanager/interface/widget/widget_chart.dart';
import 'package:moneymanager/interface/widget/transaksi_list.dart';
import 'package:moneymanager/interface/widget/drawer.dart';
import 'package:moneymanager/interface/widget/adaptive.dart';
import 'package:moneymanager/const.dart';
import 'package:moneymanager/manage/lokaslisasi.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final localeManager = Provider.of<LocalizationManager>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          FlutterI18n.translate(context, kTitle),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(
              Icons.format_line_spacing,
              color: Colors.white,
            ),
            onPressed: () {
              // open filters screen
              Navigator.pushNamed(context, kFiltersScreenID);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.translate,
              color: Colors.white,
            ),
            onPressed: () {
              print('Toggle App Language');
              Localizations.localeOf(context) == Locale('en')
                  ? localeManager.setPreferredLocale = Locale('id')
                  : localeManager.setPreferredLocale = Locale('en');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              print('Refresh');
              Localizations.localeOf(context) == Locale('id')
                  ? localeManager.setPreferredLocale = Locale('id')
                  : localeManager.setPreferredLocale = Locale('id');
            },
          ),



        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Platform.isIOS
          ? Container(
        height: 80,
      )
          : FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.teal,
          size: 30,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          // open modal bottom sheet
          addNewTransaction(context);
        },
        mini: false,

      ),
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: isLandscape
            ? Column(
          children: [
            AdaptiveSwitch(
              switchState: (newVal) {
                setState(() {
                  _showChart = newVal;
                }
                );

              },
            ),
            _showChart
                ? Container(
              height: mediaQuery.size.height * 0.3,
              child: Chart(),
            )
                : Flexible(child: TransactionsList()),
          ],
        )
            : Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.3,
              child: Chart(),
            ),
            Flexible(child: TransactionsList()),
          ],
        ),

      ),
    );
  }

  // This to open the Add new transaction screen.
  void addNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddTransaction();
      },
      isScrollControlled: true,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
    );
  }

  // This method will be called when the device orientation changes
  // so I re-initialize _showChart variable to false each time it is called.
  @override
  void didChangeDependencies() {
    _showChart = false;
    super.didChangeDependencies();
  }
}
/*
_launchURL() async {
  const url = "https://google.com";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/