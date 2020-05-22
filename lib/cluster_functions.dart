import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'migrate.dart';
import 'screen2.dart' as screen2;
import 'screen2.dart';
import 'grp_reg.dart';
import 'cluster_reg.dart';
import 'addtocluster.dart';
import 'MigrateGroups.dart';

void main()=>runApp(Cluster(text:null));

class Cluster extends StatefulWidget {
  var text;
  Cluster({Key key, @required this.text}) : super(key: key);
  @override
  _Cluster createState() => _Cluster();
}
var data;
class _Cluster extends State<Cluster> {
  @override
  void initState() {
    data = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50, left: 50),
          child: Column(
            children: <Widget>[
              Text(
                "You are a Cluster admin: " ,
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text('Create Cluster'),
                onPressed: (){

                  setState(() {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (BuildContext context)=>
                          ClsReg(),
                    ));
                  });



                },
              ),
              RaisedButton(child: Text('Add groups to a cluster'),
                onPressed: (){
                  setState(() {

                    Navigator.push(context,MaterialPageRoute(
                      builder: (BuildContext context)=>
                          ATC(text: null,),
                    ));

                  });
                },),
              RaisedButton(child: Text('Migrate groups between clusters'),
                onPressed: (){
                  setState(() {

                    Navigator.push(context,MaterialPageRoute(
                      builder: (BuildContext context)=>
                          MG(text: null,),
                    ));

                  });
                },),

              RaisedButton(
                child: Text('Go Back'),
                onPressed: (){
                  setState(() {
                    print(screen2.data);
                    List<dynamic> u = screen2.data ;
                    print(u);
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
                        MyApp1(text: u)
                    ));
                  });
                },
              ),

            ],
          )
      ),
    );
  }
}