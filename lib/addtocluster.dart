import 'group_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'cluster_functions.dart';
import 'screen2.dart';
import 'grp_reg.dart';

void main()=>runApp(ATC(text:null));

class ATC extends StatefulWidget {
  var text;
  ATC({Key key, @required this.text}) : super(key: key);
  @override
  _ATC createState() => _ATC();
}
var data;
class _ATC extends State<ATC> {

  @override
  void initState() {
    data = widget.text;
    super.initState();
    getGroups();
    getClusters();

  }
  List<String> s=[""];
  static List<String> s1=[""];
  var dataJson=[];
  var dataJson1=[];
  String groupid1 = null;
  String groupid2 = null;
  String groupid3 = null;
  String groupid4 = null;
  String groupid5 = null;
  String groupid6 = null;
  String groupid7 = null;
  String groupid8 = null;
  String groupid9 = null;
  String groupid10 = null;
  String clusterid=null;
  List<String> _groupid = [""] ;
  List<String> _clusterid = [""] ;

  Future<String> getGroups()async{
    print(dataJson.isEmpty);

    String url = "http://10.0.2.2:4000/";
    print(url);

    Response response = await http.get(url,headers: {"Accept":"application/json"});
    print(response.headers);
    setState(() {
      dataJson = json.decode(response.body);
      print(dataJson);
      //print(dataJson.length);
      if(dataJson!=null){
        //s=[dataJson[0]['group_id']];
        s.removeAt(0);
        for(int i=0;i<dataJson.length;i++){
          print(dataJson[i]);
          print(dataJson[i]['group_id']!='0' && dataJson[i]['cluster_id']=='0');
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

  Future<String> getClusters()async{
    print(dataJson1.isEmpty);
    s1=[""];
    String url = "http://10.0.2.2:4000/atc/clusters";
    print(url);

    Response response = await http.get(url,headers: {"Accept":"application/json"});
    print(response.headers);
    setState(() {
      dataJson1 = json.decode(response.body);
      print(dataJson1);
      //print(dataJson.length);
      if(dataJson1!=null){
        s1.removeAt(0);
        for(int i=0;i<dataJson1.length;i++){
          if(dataJson1[i]['cluster_id']!='0'){
            s1.add(dataJson1[i]['cluster_id']);
          }
        }s1.cast<String>();
        print(s1);
        _clusterid=s1;
        print(_clusterid);
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

  Future add(String groupid) async {
    final uri = "10.0.2.2:4000";
    final path = "/cr/"+groupid;
    final url= Uri.http(uri,path);

    print(url);
    Map<String, String> body = {
      "group_id":groupid,
      "cluster_id":clusterid,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //GroupId
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: clusterid, items:_clusterid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    clusterid = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the Cluster'),
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
                    });
                  },
                  hint: Text('Select the group'),
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
                    });
                  },
                  hint: Text('Select the group'),
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
                    });
                  },
                  hint: Text('Select the group'),
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
                    });
                  },
                  hint: Text('Select the group'),
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
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid6, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid6 = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid7, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid7 = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid8, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid8 = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid9, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid9 = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid10, items:_groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid10 = value;
                    setState(() {
                    });
                  },
                  hint: Text('Select the group'),
                ),
              ),

              RaisedButton(child: Text('Add'),
                onPressed: (){
                  setState(() {
                    if(_formKey.currentState.validate())
                    {
                      add(groupid1);
                      add(groupid2);
                      add(groupid3);
                      add(groupid4);
                      add(groupid5);
                      add(groupid6);
                      add(groupid7);
                      add(groupid8);
                      add(groupid9);
                      add(groupid10);
                      _ackAlert(context);

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
