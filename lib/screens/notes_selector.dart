import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';import 'package:mynitfinal/models/notes.dart';
import 'package:mynitfinal/utils/api_client.dart';
import 'package:open_file/open_file.dart';

import 'add_contibute_screen.dart';
class NoteSelector extends StatefulWidget {
  final String branch,sem,subjectName;
  final int SubjectId;
  NoteSelector({this.branch,this.sem,this.SubjectId,this.subjectName});
  @override
  _NoteSelectorState createState() => _NoteSelectorState();
}

class _NoteSelectorState extends State<NoteSelector> {
  ApiClient _apiClient = ApiClient();
  bool modalHud = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ModalProgressHUD(
        progressIndicator: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Downloading..."),
            SizedBox(height: 10,),
            CircularProgressIndicator(),
          ],
        ),
        inAsyncCall: modalHud,
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(2.0)),
              Expanded(
                  child: FutureBuilder(
                    future: _apiClient.getNotes(widget.SubjectId),
                    builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                      print("from snapshot " + snapshot.data.toString());
                      if (snapshot.hasData) {
                        return snapshot.data.length==0?Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: Text("Oh no 🙁. There are no documents here",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                            Center(child: Text("Please contribute to our community ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                            Center(child: Text("by clicking on the + button below😃",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),))
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
                                  onTap: ()async{
                                    setState(() {
                                      modalHud = true;
                                    });
                                    File file = await DefaultCacheManager().getSingleFile(snapshot.data[i].link);
                                    setState(() {
                                      modalHud = false;
                                    });
                                    OpenFile.open(file.path);
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
        ),
      ),
      floatingActionButton: modalHud?null:FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FullScreenDialog(branch: widget.branch,sem: widget.sem,subjectId: widget.SubjectId,subjectName: widget.subjectName,type: 3,),
              fullscreenDialog: true,
            ),
          );
        },
        tooltip: 'Add/Contribute',
        child: Icon(Icons.add),
      ),
    );
  }
}
