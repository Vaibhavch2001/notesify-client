import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:mynitfinal/screens/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mynitfinal/screens/screen_loader.dart';
import 'package:mynitfinal/utils/constants.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  bool isLoggedin = false;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//  @override
//  void initState() {
//
//    try {
//      versionCheck(context);
//    } catch (e) {
//      print(e);
//    }
//    super.initState();
//  }
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown
//    ]);
    return
     FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return MaterialApp(
        theme: ThemeData.dark(),
        title: 'Flutter',
          home: LoaderScreen()
        );}
        return Container();
        });
  }
}


