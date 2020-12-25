import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Info extends StatelessWidget {
  final List data;
  Info(this.data);
  @override
  Widget build(BuildContext context) {
    data.removeLast();
    data.shuffle();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            if (data[index].name == 'empty') {}
            return Card(
              elevation: 0,
              color: Colors.transparent,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name: ${data[index].name}'),
                    Text('Location: ${data[index].location}'),
                    Text('Number: ${data[index].number}')
                  ],
                ),
                onTap: () =>
                    moreoptions(context, data[index].number.toString()),
              ),
            );
          }),
    );
  }

  moreoptions(BuildContext context, String number) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Options'),
          actions: [
            FlatButton(child: Row(
              children: [
                Icon(Icons.map),
                SizedBox(width: 10,),
                Text('Get Direction'),
              ],
            ), onPressed: () => null),
            FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 10,),
                    Text('Call'),
                  ],
                ), onPressed: () => phone(number))
          ],
        ),
      );
  phone(String number) {
    UrlLauncher.launch('tel:${number.toString()}');
  }
}
