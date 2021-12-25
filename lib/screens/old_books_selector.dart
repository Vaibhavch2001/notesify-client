import 'package:flutter/material.dart';
import 'package:mynitfinal/utils/api_client.dart';
class OldBooksSelector extends StatefulWidget {
  @override
  _OldBooksSelectorState createState() => _OldBooksSelectorState();
}

class _OldBooksSelectorState extends State<OldBooksSelector> {
  @override
  Widget build(BuildContext context) {
    ApiClient apiClient = ApiClient();
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy/Sell Books'),
      ),
      body: SafeArea(
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(30),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Card(
                      child: GestureDetector(
                        onTap: (){
//                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "3",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                              child: Text(
                                "Buy Books",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'You can see all your listings and open/close them',
                      child: Card(
                        child: GestureDetector(
                          onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "4",)));
                          },
                          child: Container(

                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                                child: Text(
                                  "My listings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 20.0),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: GestureDetector(
                        onTap: (){
//                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "5",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                              child: Text(
                                "Add Listing",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
