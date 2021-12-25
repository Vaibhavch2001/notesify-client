import 'package:flutter/material.dart';
import 'package:mynitfinal/utils/api_client.dart';
class AllListings extends StatefulWidget {
  @override
  _AllListingsState createState() => _AllListingsState();
}

class _AllListingsState extends State<AllListings> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.0)),
          Expanded(
              child: FutureBuilder(
                future: _apiClient.getAllListings(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  print("from snapshot " + snapshot.data.toString());
                  if (snapshot.hasData) {
                    return snapshot.data.length==0?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text("Oh no 🙁. There are no active listings now",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                        Center(child: Text("Head over here soon to find new books",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),))
                      ],
                    ):ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int i) {
                        return snapshot.data[i]!=null?
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 4.0),
                          child: Card(
                            elevation: 5.0,
                            child: InkWell(
                              onTap: (){
                              },
                              child: Container(
                                height: 50.0,
                                child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 20.0,),
                                    Text(
                                      snapshot.data[i].name,
                                      style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),                                        ),


                                    Spacer(flex: 5,)
                                    ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
                                    SizedBox(width: 20.0,),
                                  ],
                                ),
                              ),

                            ),
                          ),
                        ):SizedBox.shrink();
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
