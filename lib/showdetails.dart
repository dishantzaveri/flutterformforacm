// ignore_for_file: prefer_typing_uninitialized_variables, empty_constructor_bodies, camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import, non_constant_identifier_names, unnecessary_const, deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';

class showdetails extends StatefulWidget {
  final emailvalue;
  final agevalue;
  final dateofbirthvalue;
  final passwordvalue;
  final phonevalue;

  const showdetails({
    this.emailvalue,
    this.agevalue,
    this.dateofbirthvalue,
    this.passwordvalue,
    this.phonevalue,
  });

  @override
  _showdetailsState createState() => _showdetailsState();
}

class _showdetailsState extends State<showdetails> {
  get children => null;

  get appBar => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: const Text("Your Profile"),
          leading: const Icon(Icons.people_outline_sharp),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
          child: Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.emailvalue,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.red,
                      fontSize: 25),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
          child: Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.dateofbirthvalue,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.red,
                      fontSize: 25),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
          child: Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.phonevalue,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.red,
                      fontSize: 20),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
          child: Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.agevalue,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.red,
                      fontSize: 25),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
          child: Container(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.passwordvalue,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.red,
                      fontSize: 25),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 70,
              width: 200,
              child: Align(
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white70,
                      fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
