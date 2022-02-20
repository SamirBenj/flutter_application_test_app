import 'package:flutter/material.dart';

class DetailCateg extends StatefulWidget {
  DetailCateg({Key? key, required this.nomCateg}) : super(key: key);
  final nomCateg;
  @override
  State<DetailCateg> createState() => _DetailCategState();
}

class _DetailCategState extends State<DetailCateg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomCateg),
      ),
      body: Column(children: []),
    );
  }
}
