// ignore_for_file: prefer_typing_uninitialized_variables, empty_constructor_bodies, camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class showdetails extends StatefulWidget {
  final emailvalue;
  const showdetails({
    this.emailvalue,
  });

  @override
  _showdetailsState createState() => _showdetailsState();
}

class _showdetailsState extends State<showdetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(widget.emailvalue),
      ),
    );
  }
}
