import 'package:flutter/material.dart';
import 'package:mynitfinal/models/subjects.dart';
import 'package:mynitfinal/screens/books_selector.dart';
import 'package:mynitfinal/screens/notes_selector.dart';
import 'package:mynitfinal/screens/pastPapers_selector.dart';
import 'package:mynitfinal/screens/slides_selector.dart';
import 'package:mynitfinal/utils/api_client.dart';
class TypeSelector extends StatefulWidget {
  final int subjectId;
  final String sem,branch,subjectName;
  TypeSelector({ this.subjectId,this.subjectName, this.branch, this.sem});
  @override
  _TypeSelectorState createState() => _TypeSelectorState();
}

class _TypeSelectorState extends State<TypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Type",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(2.0)),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 4.0),
              child: Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SlideSelector(branch: widget.branch,sem: widget.sem,SubjectId: widget.subjectId,subjectName: widget.subjectName,)) );},
                  child: Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20.0,),
                        Text(
                          'Slides',
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),                        ),
                        Spacer(flex: 5,)
                        ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 4.0),
              child: Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteSelector(branch: widget.branch,sem: widget.sem,SubjectId: widget.subjectId,subjectName: widget.subjectName,)) );},
                  child: Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20.0,),
                        Text(
                          'Notes',
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),                        ),
                        Spacer(flex: 5,)
                        ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 4.0),
              child: Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BookSelector(branch: widget.branch,sem: widget.sem,SubjectId: widget.subjectId,subjectName: widget.subjectName,)) );},
                  child: Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20.0,),
                        Text(
                          'Books',
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),                        ),
                        Spacer(flex: 5,)
                        ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 4.0),
              child: Card(
                elevation: 5.0,
                child: InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PastPaperSelector(branch: widget.branch,sem: widget.sem,SubjectId: widget.subjectId,subjectName: widget.subjectName,)) );},
                  child: Container(
                    height: 50.0,
                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20.0,),
                        Text(
                          'Past Papers',
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),                        ),
                        Spacer(flex: 5,)
                        ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
