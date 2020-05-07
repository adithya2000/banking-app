import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'screen2.dart';
import 'grp_reg.dart';
import 'addtogroup.dart';

void main()=>runApp(Group());

class Group extends StatefulWidget {


  @override
  _Group createState() => _Group();
}

class _Group extends State<Group> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50, left: 50),
          child: Column(
            children: <Widget>[
              Text(
                 "You are a group admin: " ,
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text('Group Register(Admin)'),
                onPressed: (){

                    setState(() {
                      Navigator.push(context,MaterialPageRoute(
                        builder: (BuildContext context)=>
                            GrpReg(),
                      ));
                    });



                },
              ),
              RaisedButton(child: Text('Add user to Group'),
                onPressed: (){
                  setState(() {

                        Navigator.push(context,MaterialPageRoute(
                          builder: (BuildContext context)=>
                          ATG(),
                        ));



                  });
                },)
            ],
          )
      ),
    );
  }
}