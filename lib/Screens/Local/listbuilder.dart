import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Info extends StatefulWidget {
  final List data;
  Info(this.data);

  @override
  _InfoState createState() => _InfoState(data);
}

class _InfoState extends State<Info> {
  final List searchList;
  _InfoState(this.searchList);
  List filtered = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filtered = searchList;
    filtered.removeLast();
  }

  // List searchList = List();
  // searchList = widget.data;
  //   searchList.removeLast();
  //   searchList.shuffle();
  @override
  Widget build(BuildContext context) {
    // widget.data.removeLast();
    // widget.data.shuffle();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          searchbar(),
          Expanded(
            child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (BuildContext context, int index) {
                  if (filtered[index].name == 'empty') {}

                  return Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Name: ${filtered[index].name}'),
                          Text('Location: ${filtered[index].location}'),
                          Text('Number: ${filtered[index].number}')
                        ],
                      ),
                      onTap: () => moreoptions(
                          context, filtered[index].number.toString()),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  moreoptions(BuildContext context, String number) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Options'),
          actions: [
            FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.map),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Get Direction'),
                  ],
                ),
                onPressed: () => null),
            FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Call'),
                  ],
                ),
                onPressed: () => phone(number))
          ],
        ),
      );

  phone(String number) {
    UrlLauncher.launch('tel:${number.toString()}');
  }

  searchbar() {
    return Material(
      color: Colors.transparent,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Color(0x55434343),
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search by name or location",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            filtered = searchList
                .where((items) => (items.name.toLowerCase().contains(text) ||
                    items.location.toLowerCase().contains(text)))
                .toList();
          });
        },
      ),
    );
  }
}
