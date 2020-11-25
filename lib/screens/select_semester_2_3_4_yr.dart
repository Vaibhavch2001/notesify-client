import 'package:flutter/material.dart';

import 'Subject_selector.dart';

class SelectSem234 extends StatefulWidget {
  String branch;
  SelectSem234({this.branch});
  @override
  _SelectSem234State createState() => _SelectSem234State();
}

class _SelectSem234State extends State<SelectSem234> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Semester'),
      ),
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
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "3",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "3rd Sem",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                    Card(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "4",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "4th Sem",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                    Card( 
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "5",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "5th Sem",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                    Card(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "6",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "6th Sem",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ), 
                    
                    Card( 
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "7",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "7th Sem",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              )),
                        ),
                      ),
                    ),
                    Card( 
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "8",)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              ),
                          child: Center(
                              child: Text(
                                "8th Sem",
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
