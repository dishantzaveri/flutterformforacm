// ignore_for_file: avoid_print, unused_import, unused_local_variable, unused_element
import 'package:acmfluttertask/showdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  late String emailvalue1 = "";

  late SharedPreferences prefs;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fill your Profile"),
        leading: const Icon(Icons.spa),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (emailvalue) {
                  prefs.setString("email", emailvalue);
                  print(prefs.getString("email"));
                  emailvalue1 = emailvalue;
                },
                validator: (emailvalue) {
                  if (emailvalue!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailvalue)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of birth'),
                keyboardType: TextInputType.datetime,
                onFieldSubmitted: (dateofbirthvalue) {
                  prefs.setString("dateofbirth", dateofbirthvalue);
                  print(prefs.getString("dateofbirth"));
                },
                validator: (dateofbirthvalue) {
                  if (dateofbirthvalue!.isEmpty ||
                      !RegExp(r"^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$")
                          .hasMatch(dateofbirthvalue)) {
                    return 'Enter a valid date of birth';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (phonevalue) {
                  prefs.setString("phone", phonevalue);
                  print(prefs.getString("phone"));
                },
                validator: (phonevalue) {
                  if (phonevalue!.isEmpty ||
                      !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(phonevalue)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (agevalue) {
                  prefs.setString("age", agevalue);
                  print(prefs.getString("age"));
                },
                validator: (agevalue) {
                  if (agevalue!.isEmpty ||
                      !RegExp(r'(^100|[1-9]?\d$)').hasMatch(agevalue)) {
                    return 'Enter a valid age';
                  }
                  return null;
                },
              ),

              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              //text input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (passwordvalue) {
                  prefs.setString("password", passwordvalue);
                  print(prefs.getString("password"));
                },
                obscureText: true,
                validator: (passwordvalue) {
                  if (passwordvalue!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => showdetails(
                                emailvalue: emailvalue1,
                              )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
