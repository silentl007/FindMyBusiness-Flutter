import 'package:FMB/Screens/Local/listbuilder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'dart:async';
import 'dart:convert';

class Business extends StatefulWidget {
  final List parameters;
  Business({this.parameters});
  @override
  _BusinessState createState() => _BusinessState(parameters);
}

class _BusinessState extends State<Business> {
  final List userparameters;
  _BusinessState(this.userparameters);
  List<DataField> businessdata = [];
  Future<List> _dataprocess() async {
    try {
      var link =
          "https://deployment-fmb.herokuapp.com/data/${userparameters[0]}/${userparameters[1]}";
      var databasedata = await http.get(link);
      var json = jsonDecode(databasedata.body);
      if (json != null) {
        for (var info in json) {
          DataField collected = DataField(
              name: info['Name'],
              location: info['Location'],
              number: info['Number']);
          businessdata.add(collected);
        }
        businessdata.add(DataField(name: 'empty'));
      }

      return businessdata;
    } catch (e) {
      List businessdata = ['failed'];
      return businessdata;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Businesses'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder(
            future: _dataprocess(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoadingBouncingGrid
                            .square(), // loading animation for fetching data
                        Text('Fetching Data')
                      ],
                    ),
                  ),
                );
              } else if (snapshot.data[0] == 'failed') {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'No Internet Connection'), // reset button if no internet
                        ]),
                  ),
                );
              }
              return snapshot.data[0].name == 'empty'
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/background.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                        child: Text('Sorry, no business at the moment'),
                      ),
                    )
                  : Info(snapshot.data);
            }),
      ),
    );
  }
}

class DataField {
  String name;
  String location;
  String number;
  DataField({this.location, this.name, this.number});
}
// Info(snapshot.data.length, snapshot.data)
