import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mynitfinal/models/slides.dart';
import 'package:mynitfinal/screens/pdfViewScreen.dart';
import 'package:mynitfinal/utils/api_client.dart';
import 'dart:io';


import 'add_contibute_screen.dart';
class SlideSelector extends StatefulWidget {
  final String branch,sem,subjectName;
  final int SubjectId;
  SlideSelector({this.branch,this.sem,this.SubjectId,this.subjectName});
  @override
  _SlideSelectorState createState() => _SlideSelectorState();
}

class _SlideSelectorState extends State<SlideSelector> {
  bool modalHud = false;
  ApiClient _apiClient = ApiClient();
  static const platform = const MethodChannel('notesify.vaibhav.dev/open');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slides",
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
                    future: _apiClient.getSlides(widget.SubjectId),
                    builder: (BuildContext context, AsyncSnapshot<List<Slide>> snapshot) {
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
                        ): ListView.builder(
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
                                    openFile(file.path);

//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute<dynamic>(
//                                          builder: (_) =>pdfPage(file: file,)));
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
              builder: (BuildContext context) => FullScreenDialog(branch: widget.branch,sem: widget.sem,subjectId: widget.SubjectId,subjectName: widget.subjectName,type: 1,),
              fullscreenDialog: true,
            ),
          );
        },
        tooltip: 'Add/Contribute',
        child: Icon(Icons.add),
      ),
    );

  }
  Future<void> openFile(String path) async {
    try {
      await platform.invokeMethod('openFile',{"path":path});
    } on PlatformException catch (e) {
      print("Unable to open file"+e.toString());
    }
  }
}
