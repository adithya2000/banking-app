import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'screen2.dart';

void main()=>runApp(ATG());

class ATG extends StatefulWidget {
  var text;
  ATG({Key key, @required this.text}) : super(key: key);
  @override
  _ATG createState() => _ATG();
}

class _ATG extends State<ATG> {
  static var data;
  @override
  void initState() {
    data = widget.text;
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  TextEditingController uname = TextEditingController();
  String groupid = null;
  List<String> _groupid = (jsonDecode(data) as List<dynamic>).cast<String>();

  Future add(String user) async {
    String uri = "http://10.0.2.2:4000/atg";
    final path = "/"+user;
    final url= Uri.http(uri,path);

    Map<String, String> body = {
      "username":uname.text,
      "group_id":groupid,
    };
    var r = await http.post(url, body: body);

    if(r.statusCode == 200){
      setState(() {
      });
    }
    print(r.headers);
    return ;

  }
  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
//        title: Text('Confirm Register',
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          content: const Text(
            'Successfully Added',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                add(uname.text);
                Navigator.push(context,MaterialPageRoute(
                  builder: (BuildContext context)=>
                      MyApp1(text:data),
                ));//  Navigator.push(context, MaterialPageRoute(
//  builder: (BuildContext context) => MyApp1(text:null),
//  ));
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
              TextFormField(
                autovalidate: true,
                controller: uname,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter the username to add',
                ),
                validator: (uname) {
                  uname.isEmpty ? 'Please enter the username!' : null;
                },
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButton(value: groupid, items: _groupid
                    .map((value) =>
                    DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),).toList(),
                  onChanged: (String value) {
                    groupid = value;
                    setState(() {});
                  },
                  hint: Text('Select the group'),
                ),
              ),
              RaisedButton(child: Text('Add'),
                onPressed: (){
                  setState(() {
                    if(_formKey.currentState.validate())
                    {
                      _ackAlert(context);
                    }
                    else {
                      showInSnackBar(
                          'Please fix the errors in red before submitting.');
                    }
                  });
                },)
            ],
          )),
    );
  }
}
