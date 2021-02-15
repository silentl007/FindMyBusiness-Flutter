import 'package:FMB/Screens/Logged/submitmodel.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _user = Data();
  final _formKey = GlobalKey<FormState>();
  static const List lga = [
    'Select LGA',
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
  static const List category = [
    'Select Category',
    'ICT',
    'Photography',
    'Phone Stores',
    'Fashion Designer',
    'Makeup Artiste and Studios',
    'Hair Vendor',
    'Boutique',
    'Graphics Designer',
    'Handy Men',
    'Wedding Essentials and Souvenirs',
    'Household Appliances',
    'Telecomms Office',
    'Internet Service Providers',
    'Bakery',
    'Hotels',
    'Hangout Spots',
    'Banks',
  ];
  String lgaSelect = 'Select LGA';
  String selectCategory = 'Select Category';
  Color _lgaColor = Colors.black;
  Color _categoryColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Business'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: ListView(children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Business Name'),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter business name';
                  }
                },
                onSaved: (value) => setState(() => _user.name = value),
              ),
              TextFormField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  labelText: 'Business Address',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter business address';
                  }
                },
                onSaved: (value) => setState(() => _user.location = value),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Business Number'),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter business number';
                  }
                },
                onSaved: (value) => setState(() => _user.number = value),
              ),
              Text('Select LGA',
                  style: TextStyle(color: _lgaColor, fontSize: 18)),
              Container(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: lgaSelect,
                  onChanged: (text) {
                    setState(() {
                      lgaSelect = text;
                      _user.lga = lgaSelect;
                    });
                  },
                  items: lga.map<DropdownMenuItem<String>>((text) {
                    return DropdownMenuItem(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                      ),
                      value: text,
                    );
                  }).toList(),
                ),
              ),
              Text('Select Category',
                  style: TextStyle(color: _categoryColor, fontSize: 18)),
              Container(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: selectCategory,
                  onChanged: (text) {
                    setState(() {
                      selectCategory = text;
                      _user.category = selectCategory;
                    });
                  },
                  items: category.map<DropdownMenuItem<String>>((text) {
                    return DropdownMenuItem(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                      ),
                      value: text,
                    );
                  }).toList(),
                ),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  final formdata = _formKey.currentState;
                  if (formdata.validate()) {
                    if (selectCategory == 'Select Category') {
                      setState(() {
                        _categoryColor = Colors.red;
                      });
                    } else if (lgaSelect == 'Select LGA') {
                      setState(() {
                        _lgaColor = Colors.red;
                      });
                    } else {
                      formdata.save();
                      formdata.reset();
                      _user.printout();
                      submitData();
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  submitData() {
    return showDialog(
        context: context,
        child: FutureBuilder(
          future: _user.send(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.data == 200) {
              return AlertDialog(
                content: Text('Successfully submitted!'),
              );
            } else
              return AlertDialog(
                  content: Text('Unable to submit, please try again'));
          },
        ));
  }
}
