import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: medica(),
  ));
}

class medica extends StatefulWidget {
  @override
  _medicaState createState() => _medicaState();
}

class _medicaState extends State<medica> {

  final String url = 'http://192.168.1.5:8000/allmed';

  List data;

  Future<String> getMedData() async{
    var res = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    setState(() {
      var data = json.decode(res.body);
      log(data);
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Medica",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Name: "),
                            Text(data[index]["name"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("price: "),
                            Text(data[index]["price"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("qt available: "),
                            Text(data[index]["quantityAvailable"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getMedData();
  }
}