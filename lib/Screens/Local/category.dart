import 'package:FMB/Screens/Local/result.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  final String apptitle;
  SelectCategory({this.apptitle});
  static List<TitleIcon> category = <TitleIcon>[
    TitleIcon(title: 'ICT', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Photography', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Phone Stores', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Fashion Designer', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Makeup Artiste and Studios', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Hair Vendor', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Boutique', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Graphics Designer', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Restaurants', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Handy Men', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Wedding Essentials and Souvenirs', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Household Appliances', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Telecomms Office', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Internet Service Providers', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Bakery', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Hotels', icon: Image.asset('images/google-logo.png')),
    TitleIcon(title: 'Hangout Spots', icon: Image.asset('images/facebook-logo.png')),
    TitleIcon(title: 'Banks', icon: Image.asset('images/google-logo.png')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories for $apptitle'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: category.map((category) {
              return Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  title: Text(category.title),
                  leading: category.icon ,
                  onTap: () => tracker(context, apptitle, category.title),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  tracker(BuildContext context, String lga, String category) {
    final List determiner = [];
    determiner.add(lga);
    determiner.add(category);
    print(determiner);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Business(parameters: determiner,)));
  }
}

class TitleIcon {
  String title;
  Image icon;
  TitleIcon({this.title, this.icon});
}
