import 'package:flutter/material.dart';
import 'package:moneymanager/interface/layar/tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'interface/layar/analisis.dart';
import 'interface/layar/tab.dart';
import 'interface/layar/intro.dart';
import 'interface/layar/home.dart';
import 'interface/layar/setting.dart';
import 'interface/layar/pilihan.dart';
import 'interface/layar/tentang.dart';
import 'interface/layar/kategori.dart';
import 'interface/layar/filter.dart';
import 'const.dart';
import 'manage/database.dart';
import 'manage/filter.dart';
import 'manage/interface.dart';
import 'manage/lokaslisasi.dart';
import 'manage/notif.dart';


// TODO: REFACTOR AND CLEAN THE CODE

void main() {
  // Run the app
  runApp(MyApp());

  // Read from the Database immediately after creating the app.
  DatabaseManager();

  // Initialize Notifications Manager
  NotificationsManger();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UiManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => LocalizationManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => FiltersManager(),
          ),
        ],
        child: Consumer<LocalizationManager>(
          builder: (context, localeManager, child) {
            return MaterialApp(
              locale: localeManager.preferredLocale,
              localizationsDelegates: [
                FlutterI18nDelegate(
                    forcedLocale: localeManager.preferredLocale,
                    useCountryCode: false,
                    fallbackFile: 'id.json',
                    path: 'flutter_i18n'),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en'),
                const Locale('id'),
              ],
              debugShowCheckedModeBanner: false,
              title: kTitleAr,
              theme: ThemeData(
                primarySwatch: Colors.teal,
                accentColor: Colors.orange,
                fontFamily: 'Tajawal',
              ),
              routes: {
                kHomeScreenID: (context) => HomeScreen(),
                kAnalysisScreenID: (context) => AnalysisScreen(),
                kIntroScreenID: (context) => IntroScreen(),
                kAboutScreenID: (context) => AboutScreen(),
                kSettingsScreenID: (context) => SettingsScreen(),
                kSettingsChoiceScreenID: (context) => SettingsChoiceScreen(),
                kTabsScreenID: (context) => TabsScreen(),
                kCategoryListScreenID: (context) => CategoryListScreen(),
                kFiltersScreenID: (context) => FiltersScreen(),
              },
              initialRoute: kIntroScreenID,
            );
          },
        ));
  }
}
