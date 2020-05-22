import 'package:bankingsample/cluster_functions.dart';

import 'group_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'screen2.dart';
import 'grp_reg.dart';

void main()=>runApp(ClsReg(text:null));

class ClsReg extends StatefulWidget {
  var text;
  ClsReg({Key key, @required this.text}) : super(key: key);
  @override
  _ClsReg createState() => _ClsReg();
}
var data;
class _ClsReg extends State<ClsReg> {

  @override
  void initState() {
    data = widget.text;
    super.initState();
    getGroups();

  }
  static List<String> s=[""];
  var dataJson=[];
  var datalogin;
  String groupid1 = null;
  String groupid2 = null;
  String groupid3 = null;
  String groupid4 = null;
  String groupid5 = null;
  List<String> _groupid = [""] ;

  Future<String> getGroups()async{
    print(dataJson.isEmpty);

    String url = "http://10.0.2.2:4000/";
    print(url);

    Response response = await http.get(url,headers: {"Accept":"application/json"});
    print(response.headers);
    setState(() {
      s=[""];
      dataJson = json.decode(response.body);
      print(dataJson);
      //print(dataJson.length);
      if(dataJson!=null){
       // s=[dataJson[0]['group_id']];
        s.removeAt(0);
        for(int i=0;i<dataJson.length;i++){
          if(dataJson[i]['group_id']!='0' && dataJson[i]['cluster_id']=='0'){
            s.add(dataJson[i]['group_id']);
          }
        }s.cast<String>();
        print(s);
        _groupid=s;
        print(_groupid);
      }
    });
    return " Successful";
  }


  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }


  TextEditingController clustername = TextEditingController();


  Future add(String groupid) async {
    final uri = "10.0.2.2:4000";
    final path = "/cr/"+groupid;
    final url= Uri.http(uri,path);

    print(url);
    Map<String, String> body = {
      "cluster_id":clustername.text,
    };
    var r = await http.post(url, body: body);

    if(r.statusCode == 200){
      setState(() {
      });
    }
    print(body);
    print(r.headers);
    return ;

  }
  int flag= 0;
  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'Successfully Added',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (BuildContext context)=>
                       Cluster(text: null,),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> getlogin(String groupid)async{
    final uri = "10.0.2.2:4000";
    final path = "/cr/"+groupid;
    final url= Uri.http(uri,path);
    print(url);

    http.Response response = await http.get(url,headers: {"Accept":"application/json"});
    print(response.headers);
    setState(() {
      datalogin = json.decode(response.body);
      print(datalogin);
    });
    return " Successful";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //GroupId
              TextFormField(
                autovalidate: true,
                controller: clustername,
                decoration: InputDecoration(
                  labelText: 'Cluster number',
                  hintText: 'Enter the Cluster Number',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid1, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid1 = value;
                    setState(() {
                      getlogin(groupid1);
                      print(datalogin[0]['cluster_id']);
                      if(datalogin[0]['cluster_id']!='0')
                        flag++;
                    });
                  },
                  hint: Text('Select the first group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid2, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid2 = value;
                    setState(() {
                      getlogin(groupid2);
                      print(datalogin[0]['cluster_id']);
                      if(datalogin[0]['cluster_id']!='0')
                        flag++;
                    });
                  },
                  hint: Text('Select the second group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid3, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid3 = value;
                    setState(() {
                      getlogin(groupid3);
                      print(datalogin[0]['cluster_id']);
                      if(datalogin[0]['cluster_id']!='0')
                        flag++;
                    });
                  },
                  hint: Text('Select the third group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid4, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid4 = value;
                    setState(() {
                      getlogin(groupid4);
                      print(datalogin[0]['cluster_id']);
                      if(datalogin[0]['cluster_id']!='0')
                        flag++;
                    });
                  },
                  hint: Text('Select the fourth group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid5, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid5 = value;
                    setState(() {
                      getlogin(groupid5);
                      print(flag);
                      print(datalogin[0]['cluster_id']);
                      if(datalogin[0]['cluster_id']!='0')
                        flag++;
                    });
                  },
                  hint: Text('Select the fifth group'),
                ),
              ),

              RaisedButton(child: Text('Add'),
                onPressed: (){
                  setState(() {
                    if(_formKey.currentState.validate())
                    {
                    print(flag);
                    if(flag==0){
                        if(groupid1!=groupid2 && groupid1!=groupid3 && groupid1!=groupid4 && groupid1!=groupid5 && groupid2!=groupid3 && groupid2!=groupid4 && groupid2!=groupid5 && groupid3!=groupid4 && groupid3!=groupid5 && groupid4!=groupid5){
                          add(groupid1);
                        add(groupid2);
                        add(groupid3);
                        add(groupid4);
                        add(groupid5);
                        _ackAlert(context);

                      }
                    }

                    else
                      Navigator.push(context,MaterialPageRoute(
                          builder: (BuildContext context)=>
                              Cluster (text: null,)));
                    }
                    else {
                      showInSnackBar(
                          'Please fix the errors in red before submitting.');
                    }
                  });
                },),
              RaisedButton(child: Text('Back'),
                onPressed: (){
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },)
            ],
          )),
    );
  }
}
