import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String moveId;

  const DetailPage(this.moveId);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail"),),
        body: Center(child: Text("DetailPage")));
  }
}
