import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mynitfinal/utils/api_client.dart';
//import 'package:open_file/open_file.dart';

class FullScreenDialog extends StatefulWidget {
  FullScreenDialog({this.type,this.subjectName,this.branch,this.sem,this.subjectId});
  String branch, sem;
  String subjectName;
  int subjectId;
  int type;

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}
class _FullScreenDialogState extends State<FullScreenDialog> {
  TextStyle myStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold);
  File file;
  String fileName;
  String docName = "";
  ApiClient _apiClient = ApiClient();
  bool successPause = true;
  bool errorPause = true;
  bool progressHud = false;
  TextEditingController inpController = TextEditingController();
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Add Document'),
        ),
        body: Stack(
          children: [

            ModalProgressHUD(
              inAsyncCall:progressHud,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(

                      children: [SizedBox(width: 15.0,),Text('Subject :  ',style: myStyle,), Text(widget.subjectName,style: myStyle,)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [SizedBox(width: 15.0,),
                        Text('  Type    :  ',style: myStyle,),
                        Text(widget.type==1?'Slides':widget.type==2?'Books':widget.type==3?'Notes':'Past Papers',style: myStyle,)
                      ],
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Suitable name for your document',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              controller: inpController,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                hintText: "Enter a descriptive document name",
                              ),
                              onChanged: (value){
                                setState(() {
                                  docName = value;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                  Padding(padding: EdgeInsets.only(left:25.0),
                    child: RaisedButton(
                      child: Text("Pick Document"),
                      onPressed: ()async{
                        await pickDocument();
                      }
                    ),),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [SizedBox(width: 15.0,),
                        Text('Document:',style: myStyle,),
                        Spacer(flex: 1,),
                        GestureDetector (onTap: fileName==null?null:()async{
                          print("Happening");
//                           OpenFile.open(file.path);
                        },child: Text(fileName==null?"No document picked yet":fileName.length>28?fileName.substring(0,25)+"...":fileName,style: myStyle,)),
                        Spacer(flex: 1,),
                        fileName!=null?Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Tooltip(
                            message: "Deselect the file",
                            child: IconButton(icon: Icon(Icons.delete_outline,color: Colors.red,) , onPressed: (){
                              setState(() {
                                fileName = null;
                              });}),
                          ),
                        ):SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.deepPurpleAccent,
                          child: Text("    Submit Document    "),
                          onPressed: (fileName!=null && docName!=null && docName.length>5)?()async{
                            await addDocument();
                          }:null
                      ),),
                  ),
                ],
              ),
            ),
            successPause?SizedBox.shrink():FlareActor("animations/success.flr",animation: "open and close",fit: BoxFit.contain),
            errorPause?SizedBox.shrink():FlareActor("animations/error.flr",animation: "error",fit: BoxFit.contain),

          ],
        ));
  }
  pickDocument()async{
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result != null) {
       file = File(result.files.single.path);
//       file = File(path);

       setState(() {
         fileName = result.files.single.name;
//       fileName = "TEST";
       });
  }
    else{
      print("User cancelled");
    }
  }
  addDocument()async{
    setState(() {
      progressHud = true;
    });
//    if(file.path==null)
    StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(docName+"_type="+widget.type.toString()+"_sid="+widget.subjectId.toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(file);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
    (value) async{
      print("Done: $value");
      await (widget.type==1?
           _apiClient.addSlide(widget.subjectId, docName, value):
      widget.type==2?
       _apiClient.addBook(value, docName, widget.subjectId):
      widget.type==3?
       _apiClient.addNotes(widget.subjectId, docName, value):
       _apiClient.addPastPapers(widget.subjectId, docName, value)).then((value){
         setState(() {
           progressHud = false;
           successPause = false;
         });
         Future.delayed(Duration(seconds: 3) ,(){Navigator.pop(context);});
        //implement success and then navigator.pop
      }).catchError((error){
        setState(() {
          progressHud = false;
          successPause = false;
        });
        Future.delayed(Duration(seconds: 5) ,(){setState(() {
          successPause = true;
        });});
        //implement error display
      });
    },
    );
  }
}
