import 'package:flutter/material.dart';
import 'package:mynitfinal/models/subjects.dart';
import 'package:mynitfinal/screens/type_selector.dart';
import 'package:mynitfinal/utils/api_client.dart';
class SubjectSelector extends StatefulWidget {
 final String branch,sem;
  SubjectSelector({this.branch,this.sem});
  @override
  _SubjectSelectorState createState() => _SubjectSelectorState();
}

class _SubjectSelectorState extends State<SubjectSelector> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Subject",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Column(
          children: [
          Padding(padding: EdgeInsets.all(2.0)),
            Expanded(
                child: FutureBuilder(
                  future: _apiClient.getSubjectsByBranchAndSem(widget.branch,widget.sem),
                  builder: (BuildContext context, AsyncSnapshot<List<Subject>> snapshot) {
                    print("from snapshot " + snapshot.data.toString());
                    if (snapshot.hasData) {
                      if(snapshot.data.length==0)
                        return Center(child: Text('Coming Soon....'),);
                      return ListView.builder(
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
                                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TypeSelector(subjectId:snapshot.data[i].id,sem: widget.sem,branch: widget.branch,subjectName: snapshot.data[i].name,))) ;},
                                child: Container(
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20.0,),
//                                      Spacer(flex: 1,),
                                      Text(
                                        snapshot.data[i].name,
                                        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(flex: 5,)
                                      ,Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
//                                      Spacer(flex: 1,),
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
    );
  }
}
