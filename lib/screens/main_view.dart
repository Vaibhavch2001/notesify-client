import 'package:flutter/material.dart';
import 'package:mynitfinal/screens/select_semester_1styr.dart';
import 'package:mynitfinal/screens/select_semester_2_3_4_yr.dart';
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Notesify')),),
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
                    //0xff2f2f2f
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem1(branch: "1YR",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),
                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/1.png',scale: 6,),
                            SizedBox(height: 15.0,),
                            Text("1st Year",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CSE",))),
                      child: Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/science.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text("CSE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                      ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "ECE",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/transceiver.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('ECE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "EEE",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/innovation.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('EEE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "MECH",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/engineering.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('MECH',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CHEM",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/chemistry.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('CHEM',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "META",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/furnace.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('META',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSem234(branch: "CIVIL",))),
                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) ),

                        child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Image.asset('images/engineer.png',scale: 6,),
                          SizedBox(height: 15.0,),
                          Text('CIVIL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:14.0),)
                        ],

                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
//1YR CSE ECE EEE MECH CHEM CIVIL META