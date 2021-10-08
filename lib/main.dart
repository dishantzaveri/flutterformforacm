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
        brightness: Brightness.light,
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
  late String dateofbirthvalue1 = "";
  late String phonevalue1 = "";
  late String agevalue1 = "";
  late String passwordvalue1 = "";

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
        title: const Text("Fill Your Profile"),
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
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.red),
                decoration: const InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (emailvalue) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
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
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.red),
                decoration: const InputDecoration(labelText: 'Date of birth'),
                keyboardType: TextInputType.datetime,
                onFieldSubmitted: (dateofbirthvalue) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("dateofbirth", dateofbirthvalue);
                  print(prefs.getString("dateofbirth"));
                  dateofbirthvalue1 = dateofbirthvalue;
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
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.red),
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (phonevalue) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("phone", phonevalue);
                  print(prefs.getString("phone"));
                  phonevalue1 = phonevalue;
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
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.red),
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (agevalue) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("age", agevalue);
                  print(prefs.getString("age"));
                  agevalue1 = agevalue;
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
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              //text input
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.red),
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (passwordvalue) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("password", passwordvalue);
                  print(prefs.getString("password"));
                  passwordvalue1 = passwordvalue;
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
                height: MediaQuery.of(context).size.width * 0.03,
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
                      fontSize: 22.0,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showdetails(
                                  emailvalue: emailvalue1,
                                  dateofbirthvalue: dateofbirthvalue1,
                                  passwordvalue: passwordvalue1,
                                  phonevalue: phonevalue1,
                                  agevalue: agevalue1,
                                )),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
