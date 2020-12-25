import 'package:FMB/Screens/Local/category.dart';
import 'package:flutter/material.dart';

class LocalLga extends StatelessWidget {
  static const List lga = [
    'Alimosho',
    'Ajeromi-Ifelodun',
    'Kosofe',
    'Mushin',
    'Oshodi-Isolo',
    'Ojo',
    'Ikorodu',
    'Surulere',
    'Agege',
    'Ifako-Ijaiye',
    'Somolu',
    'Amuwo-Odofin',
    'Lagos Mainland',
    'Ikeja',
    'Eti-Osa',
    'Badagry',
    'Apapa',
    'Lagos Island',
    'Epe',
    'Ibeju-Lekki'
  ];
  @override
  Widget build(BuildContext context) {
    // lga.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text('Select LGA'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: ListView.builder(
            itemCount: lga.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  title: Text(lga[index]),
                  leading: Icon(Icons.stop),
                  onTap: () => gotocategory(context, lga[index]),
                ),
              );
            }),
      ),
    );
  }

  void gotocategory(BuildContext context, String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SelectCategory(
                  apptitle: title,
                )));
  }
}
