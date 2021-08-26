// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
//
// import 'package:survey/locale/AppLanguage.dart';
// import 'package:survey/locale/app_localizations.dart';
// import 'package:survey/screens/splash.dart';
//
// Future<void> main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   AppLanguage appLanguage = AppLanguage();
//   await appLanguage.fetchLocale();
//   runApp(MyApp(
//     appLanguage: appLanguage,
//   ));
//
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   final AppLanguage appLanguage;
//
//   MyApp({this.appLanguage});
//
// /*  @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ChangeNotifierProvider<AppLanguage>(
//
//       create : (_) => appLanguage,
//       child: Consumer<AppLanguage>(builder: (context, model, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           locale: model.appLocal,
//           supportedLocales: [
//             Locale('en', 'US'),
//             Locale('ar', ''),
//           ],
//           localizationsDelegates: [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//           ],
//           theme: ThemeData(
//             primaryColor: Colors.white,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//
//           ),
//           home: SplashScreen(),
//         );
//
//       }),
//     );
//
//   }
// }
//
// /*class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//
//     return ChangeNotifierProvider<AppLanguage>(
//
//       create : (_) => widget.appLanguage,
//       child: Consumer<AppLanguage>(builder: (context, model, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//             locale: model.appLocal,
//             supportedLocales: [
//               Locale('en', 'US'),
//               Locale('ar', ''),
//             ],
//             localizationsDelegates: [
//               AppLocalizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//             ],
//             theme: ThemeData(
//               primaryColor: Colors.white,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//
//             ),
//             home: SplashScreen(),
//           );
//
//       }),
//     );
//
//   }
// }*/


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:survey/screens/splash.dart';

import 'generated/l10n.dart';
import 'langProvider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LangProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String locale = Intl.getCurrentLocale();
    print("locale   ${locale}");
    var _prlan = Provider.of<LangProvider>(context);
    print("klklklklk ${_prlan.code}");
    return GetMaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Get.locale,
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(prlan: _prlan,),
    );
  }
}
