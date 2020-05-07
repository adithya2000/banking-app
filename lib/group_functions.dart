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

  List<String> s=[""];
  var dataJson=[];
  Future<String> getGroups()async{
    String url = "http://10.0.2.2:4000/";
    print(url);

    Response response = await http.get(url,headers: {"Accept":"application/json"});
    print(response.headers);
    setState(() {
      dataJson = json.decode(response.body);
      //print(dataJson.length);
      if(dataJson!=null){
        s=[dataJson[0]['group_id']];
        for(int i=1;i<dataJson.length;i++){
          if(dataJson[i]['group_id']!='0'){
            s.add(dataJson[i]['group_id']);
          }
        }s.cast<String>();
        print(s);
      }
    });
    return " Successful";
  }


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
                        getGroups();
                        Navigator.push(context,MaterialPageRoute(
                          builder: (BuildContext context)=>
                              ATG(text:s),
                        ));



                  });
                },)
            ],
          )
      ),
    );
  }
}