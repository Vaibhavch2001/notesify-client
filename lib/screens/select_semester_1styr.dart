
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mynitfinal/screens/Subject_selector.dart';
class SelectSem1 extends StatefulWidget {
  String branch;
  SelectSem1({this.branch});
  @override
  _SelectSem1State createState() => _SelectSem1State();
}

class _SelectSem1State extends State<SelectSem1> {
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
//                   onTap: ()
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "CHEM",)));
                   },
                     child: Container(
                       padding: const EdgeInsets.all(12),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
//                           color: Color(0xff2f2f2f)
                       ),
                       child: Center(
                           child: Text(
                         "Chemistry",
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 15.0),
                       )),
                     ),
                   ),
                 ),
                 Card(
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectSelector(branch: widget.branch, sem: "PHY",)));
                     },
                     child: Container(
                       padding: const EdgeInsets.all(12),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
//                         color: Color(0xff2f2f2f)
                           ),
                       child: Center(
                           child: Text(
                         "Physics",
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 15.0),
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
