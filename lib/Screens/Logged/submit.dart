import 'package:FMB/Screens/Logged/submitmodel.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _user = Data();
  final _formKey = GlobalKey<FormState>();
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
                  labelText: 'Business Location',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter location name';
                  }
                },
                onSaved: (value) => setState(() => _user.location = value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Business Number'),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter business number';
                  }
                },
                onSaved: (value) => setState(() => _user.number = value),
              ),
              DropdownButton(
                items: <DropdownMenuItem>[],
                onChanged: null,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  final formdata = _formKey.currentState;
                  formdata.save();
                  formdata.reset();
                  _user.printout();
                  _user.send(context);
                },
                child: Text('Submit'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
