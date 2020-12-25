import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Data {
  String name = '';
  String location = '';
  String number = '';
  String lga = '';
  String category = '';

  void printout() {
    print('$name -- $location -- $number -- $lga -- $category');
  }

  Future send(BuildContext context) async {
    // var link = "https://deployment-fmb.herokuapp.com/review/${lga}";
    var link = "https://deployment-fmb.herokuapp.com/review/Agege";
    Map databody = {
      'Category': '$category',
      'Name': '$name',
      'Number': '$number',
      'Location': '$location'
    };
    try {
      var tosend = await http.post(link, body: databody);
      return showDialog(
          context: context,
          child: AlertDialog(
            content: Text('Success'),
          ));
    } catch (e) {
      return showDialog(
          context: context,
          child: AlertDialog(
            content: Text('Failed'),
          ));
    }
  }
}
