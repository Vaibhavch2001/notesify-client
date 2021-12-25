import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mynitfinal/utils/api_client.dart';

import 'google_sign_in_widget.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ApiClient apiClient = ApiClient();
  var kMessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
    border: InputBorder.none,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Spacer(flex: 3,),
            Center(
              child: TypewriterAnimatedTextKit(
                totalRepeatCount: 3,
                text: ['Notesify'],
                speed: Duration(milliseconds: 300),
                textStyle: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Spacer(flex: 3,),
            FutureBuilder(
              future: ApiClient.initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                );
              },
            ),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
//User(displayName: Vaibhav Choudhary, email: vaibhavsandeepnidhi@gmail.com,
// emailVerified: true, isAnonymous: false,
// metadata: UserMetadata(creationTime: 2021-11-05 19:23:57.017, lastSignInTime: 2021-11-05 21:00:07.141),
// phoneNumber: null, photoURL: https://lh3.googleusercontent.com/a-/AOh14GjuANGWoSYB5uwQRIFQTvIQ8xRgmo0Xr9QtI_idhw=s96-c,
// providerData, [UserInfo(displayName: Vaibhav Choudhary, email: vaibhavsandeepnidhi@gmail.com, phoneNumber: null,
// photoURL: https://lh3.googleusercontent.com/a-/AOh14GjuANGWoSYB5uwQRIFQTvIQ8xRgmo0Xr9QtI_idhw=s96-c,
// providerId: google.com, uid: 106145467607822013558)], refreshToken: , tenantId: null, uid: bKi8Vko7smXvTKHlncOiaZZjnjA3)