import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynitfinal/screens/select_semester_1styr.dart';
import 'package:mynitfinal/screens/select_semester_2_3_4_yr.dart';
import 'package:mynitfinal/utils/constants.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MainView extends StatefulWidget {

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {

    try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: showDrawer(),
      appBar: AppBar(title: Text(('Notesify')),),
      body: SafeArea(

        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    //0xff2f2f2f
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem1(branch: "1YR",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),
                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/1.png',scale: 6,),
                            SizedBox(height: 15.0,),
                            Text("1st Year",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CSE",))),
                      child: Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/science.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text("CSE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                      ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "ECE",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/transceiver.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('ECE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "EEE",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/innovation.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('EEE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "MECH",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/engineering.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('MECH',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CHEM",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/chemistry.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('CHEM',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "META",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/furnace.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('META',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CIVIL",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/engineer.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('CIVIL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
Widget showDrawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        Container(
          height: 150.0,
          child: Image.asset('images/mnit.png'),
    ),
      SizedBox(height: 10.0,),
        Center(child: Text("Made with ❤ in MNIT")),
        SizedBox(height: 10.0,),
        Divider(),
        ListTile(
          title: Text(
            'Share the app with your friends!',
            style: TextStyle(fontFamily: 'Gotham', fontSize: 15.0),
          ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5.0,),
              Icon(Icons.share,color: Colors.white,size: 25.0,),
            ],
          ),
          onTap: (){
            Share.share("Check out Notesify on Google play. It allows you to Download and Share Notes at ease. "+Constant.googlePlayUrl);
          },
        ),
        Divider(),
        ListTile(
            title: Text(
              "Report a Bug",
              style: TextStyle(fontFamily: 'Gotham', fontSize: 15.0),
            ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5.0,),
              Image.asset('images/rab.png',height: 35.0,),
            ],
          ),
          onTap: (){
              String temp = "mailto:"+Constant.bugEmail+"?subject=BugReport";
              _launchURL(temp);
          },
            ),
        Divider(),
        ListTile(
            title: Text(
            "Rate us on Google Play!",
              style: TextStyle(fontFamily: 'Gotham', fontSize: 15.0),
            ),
            leading: (Image.asset('images/ps2.webp',height: 45.0,)),
            onTap: () {
              _launchURL(Constant.googlePlayUrl);
            }),
        Divider(),
        ListTile(
            title: Text(
//              Translations.of(context).text('logout'),
            "Follow us on Instagram!",
              style: TextStyle(fontFamily: 'Gotham', fontSize: 15.0),
            ),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8.0,),
                Image.asset('images/ig1.png',height: 25.0,),
              ],
            ),
            onTap: () {
              _launchURL(Constant.instagramUrl);
//              logoutUser();
//              Navigator.push(context, new MaterialPageRoute(builder: (context) => _loginPage));
            }),
        Divider(),
      ],
    ),
  );
}
versionCheck(context) async {
    //Get Current installed version of app
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final PackageInfo info = await PackageInfo.fromPlatform();
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
  print("Cuurent ver:"+currentVersion.toString());
  //Get Latest version info from firebase config
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  try {
    //So this is how i type with my normal keyboard
    //This ishow i type with my new keyboard. I feel good tbh
    //This feels good actually
    //I am very happy now yaar with this keyboard
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    remoteConfig.getString('force_update_current_version');
    double newVersion = double.parse(remoteConfig
        .getString('force_update_current_version')
        .trim()
        .replaceAll(".", ""));
    Constant.bugEmail = remoteConfig.getString('BUG_REPORT_EMAIL');
    Constant.googlePlayUrl = remoteConfig.getString('GOOGLE_PLAY_URL');
    Constant.instagramUrl = remoteConfig.getString('INSTAGRAM_PROFILE_URL');
    print("new ver"+newVersion.toString());

    if (newVersion > currentVersion) {
      _showVersionDialog(context);
    }
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}

_showVersionDialog(context) async {

  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = "New Update Available";
      String message = "There is a newer version of app available, please update it now to get access to our latest offers.";
      String btnLabel = "Update Now";
      String btnLabelCancel = "Later";
      return AlertDialog(

        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text(btnLabel),
            onPressed: () => _launchURL(Constant.googlePlayUrl),
          ),
          FlatButton(
            child: Text(btnLabelCancel),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
//1YR CSE ECE EEE MECH CHEM CIVIL META