import 'package:flutter/material.dart';
import 'package:mynitfinal/screens/main_view.dart';
import 'package:mynitfinal/utils/api_client.dart';

import 'loginpage.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    ApiClient apiClient = ApiClient();
    return FutureBuilder(
        future: apiClient.getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print("from snapshot ");
          print(snapshot.data);
          if (snapshot.hasData) {
            return snapshot.data == 'NULL' ? LoginPage() : MainView();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
