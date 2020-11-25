import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mynitfinal/screens/pdfViewScreen.dart';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mynitfinal/models/books.dart';
import 'package:mynitfinal/utils/api_client.dart';

import 'add_contibute_screen.dart';
class BookSelector extends StatefulWidget {
  final String branch,sem,subjectName;
  final int SubjectId;
  BookSelector({this.branch,this.sem,this.SubjectId,this.subjectName});
  @override
  _BookSelectorState createState() => _BookSelectorState();
}

class _BookSelectorState extends State<BookSelector> {
  ApiClient _apiClient = ApiClient();
  bool modalHud = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Books",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: modalHud,
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(2.0)),
              Expanded(
                  child: FutureBuilder(
                    future: _apiClient.getBooks(widget.SubjectId),
                    builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                            builder: (_) =>pdfPage(file: file,)));
                                  },
                                  child: Container(
                                    height: 70.0,
                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 20.0,),
                                        Text(
                                          snapshot.data[i].name,
                                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
                                        ),


                                        Spacer(flex: 5,)
                                        ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FullScreenDialog(branch: widget.branch,sem: widget.sem,subjectId: widget.SubjectId,subjectName: widget.subjectName,type: 2,),
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
